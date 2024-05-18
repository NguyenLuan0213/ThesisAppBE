import parser
from urllib.parse import urlparse
from django.shortcuts import get_object_or_404
from django.shortcuts import render
from rest_framework import viewsets, permissions, generics, serializers, status
from rest_framework.views import APIView

from .models import StudentDoThesis, Thesis, TeacherDoThesis, ThesisDefenseCommittee, CommitteeMember, Score, \
    Notification, User, Criteria, SpecificCriteria
from .serializers import (ThesisSerializer, StudentDoThesisSerializer, TeacherDoThesisSerializer, UserSerializer,
                          ThesisDefenseCommitteeSerializer, CommitteeMemberSerializer, ScoreSerializer,
                          NotificationSerializer, CriteriaSerializer, SpecificCriteriaSerializer)
from rest_framework.decorators import action
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.response import Response
from django.core.mail import send_mail
from django.conf import settings


class ThesisViewSet(viewsets.ModelViewSet):
    queryset = Thesis.objects.filter(active=True)
    serializer_class = ThesisSerializer
    parser_classes = [MultiPartParser]

    @action(methods=['get'], detail=False, url_path='thesis_list', url_name='thesis_list')
    def get_thesis_list(self, request):
        theses = Thesis.objects.filter(active=True)
        serializer = self.get_serializer(theses, many=True, context={'request': request})
        data = serializer.data
        for item in data:
            product_path = urlparse(item['product']).path
            report_path = urlparse(item['report']).path
            item['product'] = request.build_absolute_uri('/static' + product_path)
            item['report'] = request.build_absolute_uri('/static' + report_path)
        return Response(data)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()

        # Get related StudentDoThesis
        student_do_thesis = StudentDoThesis.objects.filter(thesis=instance)
        student_do_thesis_serializer = StudentDoThesisSerializer(student_do_thesis, many=True)

        # Get related TeacherDoThesis
        teacher_do_thesis = TeacherDoThesis.objects.filter(thesis_student__thesis=instance)
        teacher_do_thesis_serializer = TeacherDoThesisSerializer(teacher_do_thesis, many=True)

        # Get related ThesisDefenseCommittee
        thesis_defense_committee = ThesisDefenseCommittee.objects.filter(
            students_thesis_defense_committee__thesis=instance)
        thesis_defense_committee_serializer = ThesisDefenseCommitteeSerializer(thesis_defense_committee, many=True)

        # Serialize the Thesis instance
        thesis_serializer = self.get_serializer(instance)

        # Modify the 'product' and 'report' fields in the serialized data
        thesis_data = thesis_serializer.data
        product_path = urlparse(thesis_data['product']).path
        report_path = urlparse(thesis_data['report']).path
        thesis_data['product'] = request.build_absolute_uri('/static' + product_path)
        thesis_data['report'] = request.build_absolute_uri('/static' + report_path)

        # Combine all data
        data = {
            'thesis': thesis_data,
            'student_do_thesis': student_do_thesis_serializer.data,
            'teacher_do_thesis': teacher_do_thesis_serializer.data,
            'thesis_defense_committee': thesis_defense_committee_serializer.data,
        }

        return Response(data)

    @action(methods=['put'], detail=True, url_path='delete_active', url_name='delete_active')
    def delete_active(self, request, *args, **kwargs):
        # Check if the user has the necessary permissions
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền xóa."}, status=status.HTTP_403_FORBIDDEN)

        instance = self.get_object()
        if StudentDoThesis.objects.filter(thesis=instance).exists():
            return Response({"detail": "Không thể xóa khi đang có sinh viên tham gia."},
                            status=status.HTTP_400_BAD_REQUEST)
        instance.active = False
        instance.save(update_fields=['active'])
        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(methods=['post'], detail=False, url_path='create_thesis', url_name='create_thesis')
    def create_thesis(self, request, *args, **kwargs):
        # Kiểm tra xem người dùng hiện tại có quyền admin hoặc thuộc nhóm cần thiết không
        if request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists():
            serializer = self.serializer_class(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"detail": "Bạn không có quyền tạo mới."}, status=status.HTTP_403_FORBIDDEN)

    def partial_update(self, request, *args, **kwargs):
        # Kiểm tra xem người dùng hiện tại có quyền admin hoặc thuộc nhóm cần thiết không
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền cập nhật."}, status=status.HTTP_403_FORBIDDEN)
        instance = self.get_object()
        # Kiểm tra xem có StudentDoThesis nào có trạng thái 'DCD' hoặc 'DCDX' không
        if StudentDoThesis.objects.filter(thesis=instance, status='DCD').exists():
            return Response({"detail": "Đang trong quá trình chấm điểm, không thể cập nhật."},
                            status=status.HTTP_400_BAD_REQUEST)
        elif StudentDoThesis.objects.filter(thesis=instance, status='DCDX').exists():
            return Response({"detail": "Đã hoàn thành chấm điểm, không thể cập nhật."},
                            status=status.HTTP_400_BAD_REQUEST)

        serializer = self.get_serializer(instance, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class StudentDoThesisViewSet(viewsets.ModelViewSet):
    queryset = StudentDoThesis.objects.filter(active=True)
    serializer_class = StudentDoThesisSerializer

    @action(detail=True, methods=['put'])
    def update_status(self, request, pk=None):
        student_do_thesis = self.get_object()
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền xóa."}, status=status.HTTP_403_FORBIDDEN)
        status_student = request.data.get('status')
        thesis = StudentDoThesis.objects.get(id=pk).thesis
        thesis_defense_committee = StudentDoThesis.objects.get(id=pk).thesis_defense_committee
        teacher_TV = CommitteeMember.objects.filter(
            thesis_defense_committee=thesis_defense_committee,
            role='TV'
        ).values_list('teacher_user', flat=True)

        users = User.objects.filter(id__in=teacher_TV)
        email_list = list(users.values_list('email', flat=True))

        if status_student == 'DCD':
            student_do_thesis.status = status_student
            student_do_thesis.results = request.data.get("Đang chấm điểm")
            student_do_thesis.save()
            # Check if teacher_TV is not empty
            if not teacher_TV:
                return Response({"detail": "Không có giáo viên TV."}, status=status.HTTP_400_BAD_REQUEST)

            try:
                send_mail(
                    f"CHẤM ĐIỂM - {thesis.title}",  # Add the thesis title to the email subject
                    "đã tới thời gian chấm điểm cho {thesis.title}, bạn hãy vào app để chấm điểm.",
                    settings.EMAIL_HOST_USER,
                    email_list,
                    fail_silently=False,
                )
            except Exception as e:
                return Response({"detail": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            return Response({"detail": "Trạng thái và kết quả đã được cập nhật."})

        elif status_student == 'DCDX':
            scores = Score.objects.filter(student_thesis=student_do_thesis)
            total_score = sum(score.score for score in scores)
            average_score = total_score / len(scores)
            student_do_thesis.count_score = average_score
            student_do_thesis.status = status_student
            if(average_score >= 8):
                student_do_thesis.results = "Đạt"
            else:
                student_do_thesis.results = "Không đạt"
            student_do_thesis.save()
            try:
                send_mail(
                    f"KẾT QUẢ - {thesis.title}",  # Add the thesis title to the email subject
                    "Đã chấm điểm xong bạn hãy vào xem kết quả.",
                    settings.EMAIL_HOST_USER,
                    [email_list],
                    fail_silently=False,
                )
            except Exception as e:
                return Response({"detail": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            return Response({"detail": "Trạng thái và kết quả đã được cập nhật."})

        else:
            return Response({"detail": "Trạng thái không hợp lệ."}, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['get'], url_path='student_by_id/(?P<student_id>\d+)', url_name='student_by_id')
    def student_by_id(self, request, student_id=None):
        student = get_object_or_404(StudentDoThesis, id=student_id)
        student_serializer = StudentDoThesisSerializer(student)
        return Response(student_serializer.data)

    def update(self, request, *args, **kwargs):
        # Kiểm tra xem người dùng hiện tại có quyền admin hoặc thuộc nhóm 'Giáo vụ' không
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền cập nhật."}, status=status.HTTP_403_FORBIDDEN)

        instance = self.get_object()
        # Kiểm tra xem có StudentDoThesis nào có trạng thái 'DCD' hoặc 'DCDX' không
        if instance.status == 'DCD':
            return Response({"detail": "Không thể cập nhật khi đang chấm điểm."}, status=status.HTTP_400_BAD_REQUEST)
        elif instance.status == 'DCDX':
            return Response({"detail": "Không thể cập nhật khi đã chấm điểm xong."}, status=status.HTTP_400_BAD_REQUEST)

        return super().update(request, *args, **kwargs)

    def create(self, request, *args, **kwargs):
        # Check if the user has the necessary permissions
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền tạo mới."}, status=status.HTTP_403_FORBIDDEN)

        # Check for existing theses in the same committee
        existing_theses_count = StudentDoThesis.objects.filter(
            thesis_defense_committee=request.data.get('thesis_defense_committee')).values('thesis').distinct().count()
        if existing_theses_count >= 5:
            return Response({"detail": "Hội đồng khóa luận đã đầy, mời xem lại."}, status=status.HTTP_400_BAD_REQUEST)

        # Check if there is any record existing with the same thesis and student
        existing_count = StudentDoThesis.objects.filter(thesis=request.data.get('thesis'),
                                                        student=request.data.get('student')).count()
        if existing_count > 0:
            return Response({"detail": "Không được tham gia 2 lần trên cùng 1 khóa luận."},
                            status=status.HTTP_400_BAD_REQUEST)

        # Check if there are too many students for the same thesis
        max_students_per_thesis = 2
        current_student_count = StudentDoThesis.objects.filter(thesis=request.data.get('thesis')).count()
        if current_student_count >= max_students_per_thesis:
            return Response({"detail": "Đồ án này đã đầy học sinh, yêu cầu kiểm tra và chọn đúng đồ án."},
                            status=status.HTTP_400_BAD_REQUEST)

        return super().create(request, *args, **kwargs)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()

        # Get related Scores
        scores = Score.objects.filter(student_thesis=instance)
        scores_serializer = ScoreSerializer(scores, many=True)

        # Get related TeacherDoThesis
        teachers_do_thesis = TeacherDoThesis.objects.filter(thesis_student=instance)
        teachers_do_thesis_serializer = TeacherDoThesisSerializer(teachers_do_thesis, many=True)

        # Get teachers who have graded this student's thesis
        grading_teachers = CommitteeMember.objects.filter(score_committee_member__student_thesis=instance).distinct()
        grading_teachers_serializer = CommitteeMemberSerializer(grading_teachers, many=True)

        thesis_defense_committee = ThesisDefenseCommittee.objects.get(id=instance.thesis_defense_committee.id)
        thesis_defense_committee_serializer = ThesisDefenseCommitteeSerializer(thesis_defense_committee)

        thesis = Thesis.objects.get(id=instance.thesis.id)
        thesis_serializer = ThesisSerializer(thesis)

        # Serialize the StudentDoThesis instance
        student_do_thesis_serializer = self.get_serializer(instance)

        # Combine all data
        data = {
            'student_do_thesis': student_do_thesis_serializer.data,
            'thesis': thesis_serializer.data,
            'scores': scores_serializer.data,
            'teachers_do_thesis': teachers_do_thesis_serializer.data,
            'grading_teachers': grading_teachers_serializer.data,
            'thesis_defense_committee': thesis_defense_committee_serializer.data,
        }

        return Response(data)

    @action(detail=True, methods=['put'], url_path='delete_active', url_name='delete_active')
    def delete_active(self, request, *args, **kwargs):
        # Kiểm tra xem người dùng hiện tại có quyền admin hoặc thuộc nhóm 'Giáo vụ' không
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền xóa."}, status=status.HTTP_403_FORBIDDEN)

        instance = self.get_object()
        if instance.status == 'DCD':
            return Response({"detail": "Không thể xóa khi đang chấm điểm."}, status=status.HTTP_400_BAD_REQUEST)
        instance.active = False
        instance.save(update_fields=['active'])
        return Response(status=status.HTTP_204_NO_CONTENT)


class TeacherDoThesisViewSet(viewsets.ModelViewSet):
    queryset = TeacherDoThesis.objects.all()
    serializer_class = TeacherDoThesisSerializer

    def create(self, request, *args, **kwargs):
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền xóa."}, status=status.HTTP_403_FORBIDDEN)
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        # Get the teacher and student_do_thesis from the validated data
        teacher = serializer.validated_data.get('teacher')
        student_do_thesis = serializer.validated_data.get('thesis_student')

            # Check if the teacher is already guiding this student_do_thesis
        if TeacherDoThesis.objects.filter(teacher=teacher, thesis_student=student_do_thesis).exists():
            return Response({"detail": "Giáo viên này đã hướng dẫn luận văn này."}, status=status.HTTP_400_BAD_REQUEST)

        # Get the thesis title
        thesis_title = student_do_thesis.thesis.title

        # Send the email
        try:
            send_mail(
                f"Add Teacher Thesis - {thesis_title}",  # Add the thesis title to the email subject
                "Bạn là người hướng dẫn của khóa luận này, truy cập app để viết thêm chi tiết.",
                settings.EMAIL_HOST_USER,
                [teacher.email],
                fail_silently=False,
            )
        except Exception as e:
            return Response({"detail": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        try:
            send_mail(
                f"Add Teacher Thesis - {thesis_title}",  # Add the thesis title to the email subject
                f"Đồ án của bạn đã đuọc giáo viên {teacher.first_name + teacher.last_name} đảm nhận.",
                settings.EMAIL_HOST_USER,
                [student_do_thesis.student.email],
            )
        except Exception as e:
            return Response({"detail": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)

        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class ThesisDefenseCommitteeViewSet(viewsets.ModelViewSet):
    queryset = ThesisDefenseCommittee.objects.all()
    serializer_class = ThesisDefenseCommitteeSerializer
    
    def create(self, request, *args, **kwargs):
        # Check if the user has the necessary permissions
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền tạo mới."}, status=status.HTTP_403_FORBIDDEN)

        return super().create(request, *args, **kwargs)

    @action(detail=True, methods=['get'], url_path='committee_members', url_name='committee_members')
    def get_defense_committee_members(self, request, pk=None):
        # Get the ThesisDefenseCommittee object
        defense_committee = ThesisDefenseCommittee.objects.get(id=pk)

        # Get the CommitteeMember objects related to the ThesisDefenseCommittee
        committee_members = CommitteeMember.objects.filter(thesis_defense_committee=defense_committee)

        # Serialize the data
        defense_committee_serializer = ThesisDefenseCommitteeSerializer(defense_committee)
        committee_members_serializer = CommitteeMemberSerializer(committee_members, many=True)

        # Combine the data
        data = {
            'defense_committee': defense_committee_serializer.data,
            'committee_members': committee_members_serializer.data,
        }

        return Response(data)

    def delete(self, request, *args, **kwargs):
        # Check if the user has the necessary permissions
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền xóa."}, status=status.HTTP_403_FORBIDDEN)

        instance = self.get_object()
        if CommitteeMember.objects.filter(thesis_defense_committee=instance).exists():
            return Response({"detail": "Không thể xóa khi có thành viên trong ủy ban."}, status=status.HTTP_400_BAD_REQUEST)
        return super().delete(request, *args, **kwargs)

    @action(detail=True, methods=['put'], url_path='update_defense', url_name='update_defense')
    def put_update_defense(self, request, *args, **kwargs):
        # Check if the user has the necessary permissions
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền cập nhật."}, status=status.HTTP_403_FORBIDDEN)

        instance = self.get_object()
        if CommitteeMember.objects.filter(thesis_defense_committee=instance).exists():
            return Response({"detail": "Không thể cập nhật khi có thành viên trong ủy ban."},
                            status=status.HTTP_400_BAD_REQUEST)

        # Get the data from the request
        data = request.data

        # Update the fields of the instance
        for field, value in data.items():
            if hasattr(instance, field):
                setattr(instance, field, value)

        # Save the instance
        instance.save()

        # Return a successful response
        return Response({"detail": "Cập nhật thành công."}, status=status.HTTP_200_OK)

def send_notification(user, title, message):
    # Send the email
    try:
        send_mail(
            title,
            message,
            settings.EMAIL_HOST_USER,
            [user.email],
            fail_silently=False,
        )
    except Exception as e:
        return str(e)

    # Save the notification in the database
    Notification.objects.create(
        title=title,
        user=user,
        message=message,
    )

    return "Email sent successfully."


class CommitteeMemberViewSet(viewsets.ModelViewSet):
    queryset = CommitteeMember.objects.all()
    serializer_class = CommitteeMemberSerializer

    @action(detail=False, methods=['post'], url_path='join', url_name='join')
    def join_committee(self, request):
        # Check if the user has the necessary permissions
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền xóa."}, status=status.HTTP_403_FORBIDDEN)

        # Get the teacher_user and committee IDs from the request data
        teacher_user_id = request.data.get('teacher_user')
        committee_id = request.data.get('thesis_defense_committee')
        role = request.data.get('role')

        # Check if the teacher_user exists
        try:
            teacher_user = User.objects.get(id=teacher_user_id)
        except User.DoesNotExist:
            return Response({"detail": "Giáo viên ko tồn tại."}, status=status.HTTP_400_BAD_REQUEST)

        # Check if the committee exists
        try:
            committee = ThesisDefenseCommittee.objects.get(id=committee_id)
        except ThesisDefenseCommittee.DoesNotExist:
            return Response({"detail": "Hội đồng khóa luận không tồn tại."}, status=status.HTTP_400_BAD_REQUEST)

        # Check if the teacher_user is already a member of the committee
        if CommitteeMember.objects.filter(teacher_user=teacher_user, thesis_defense_committee=committee).exists():
            return Response({"detail": "Giáo viên đã là thành viên của ủy ban này."},
                            status=status.HTTP_400_BAD_REQUEST)

        # Check if the committee already has 5 members
        existing_members_count = CommitteeMember.objects.filter(thesis_defense_committee=committee).count()
        if existing_members_count >= 5:
            return Response({"detail": "Hội đồng này đã đầy thành viên, mời xem lại."},
                            status=status.HTTP_400_BAD_REQUEST)

        existing_roles = list(CommitteeMember.objects.filter(thesis_defense_committee=committee).values_list('role', flat=True))

        ct_count = existing_roles.count('CT')
        tk_count = existing_roles.count('TK')
        tv_count = existing_roles.count('TV')

        # Check if the role to be added is already at its maximum
        if (role == 'CT' and ct_count >= 1) or (role == 'TK' and tk_count >= 1) or (role == 'TV' and tv_count >= 3):
            return Response({"detail": "Vai trò này đã tồn tại trong ủy ban."}, status=status.HTTP_400_BAD_REQUEST)

        # Send a notification
        try:
            send_mail(
                f"Add Teacher To Committee Member",  # Add the thesis title to the email subject
                f"Bạn đã được bầu làm {CommitteeMember.role} của {committee.name}.",
                settings.EMAIL_HOST_USER,
                [teacher_user.email],
            )
            # Create a new Notification
            Notification.objects.create(
                title=f"Add Teacher To Committee Member",
                user=teacher_user,
                message=f"Bạn đã được bầu làm {CommitteeMember.role} của {committee.name}.",
            )
            CommitteeMember.objects.create(teacher_user=teacher_user, thesis_defense_committee=committee, role=role)
            return Response({"detail": "Giáo viên đã tham gia thành công ủy ban."}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"detail": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    @action(detail=True, methods=['get'], url_path='committee_teacher_user', url_name='committee_teacher_user')
    def get_committee_teacher_user(self, request, pk=None):
        # Check if the user has the necessary permissions
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền xem thông tin này."}, status=status.HTTP_403_FORBIDDEN)

        # Get the CommitteeMember object
        committee_member = self.get_object()

        # Get the User object
        teacher_user = User.objects.get(id=committee_member.teacher_user.id)

        # Serialize the data
        committee_member_serializer = CommitteeMemberSerializer(committee_member)
        teacher_user_serializer = UserSerializer(teacher_user)

        # Combine the data
        data = {
            'committee_member': committee_member_serializer.data,
            'teacher_user': teacher_user_serializer.data,
        }

        return Response(data)

    @action(detail=True, methods=['patch'], url_path='update_role', url_name='update_role')
    def update_role(self, request, pk=None, role=None):
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền xem thông tin này."}, status=status.HTTP_403_FORBIDDEN)

        role_committee = request.data.get('role')
        committee_member = self.get_object()
        role_teacher = committee_member.role

        if role_committee == role_teacher:
            return Response({"detail": "Vai trò không thay đổi."}, status=status.HTTP_400_BAD_REQUEST)

        # Get the ThesisDefenseCommittee of the CommitteeMember
        thesis_defense_committee = committee_member.thesis_defense_committee

        # Check if the committee already has a chairman
        if role_committee == 'CT' and CommitteeMember.objects.filter(thesis_defense_committee=thesis_defense_committee,
                                                                     role='CT').exists():
            return Response({"detail": "Hội đồng này đã có chủ tịch."}, status=status.HTTP_400_BAD_REQUEST)

        # Check if the committee already has a secretary
        if role_committee == 'TK' and CommitteeMember.objects.filter(thesis_defense_committee=thesis_defense_committee,
                                                                     role='TK').exists():
            return Response({"detail": "Hội đồng này đã có thư ký."}, status=status.HTTP_400_BAD_REQUEST)

        if role_committee == 'TV' and CommitteeMember.objects.filter(thesis_defense_committee=thesis_defense_committee,
                                                                     role='TV').count() >= 3:
            return Response({"detail": "Hội đồng này đã đủ 3 thành viên với vai trò 'TV'."},
                            status=status.HTTP_400_BAD_REQUEST)

        # If all checks pass, update the role of the CommitteeMember
        committee_member.role = role_committee
        committee_member.save()

        return Response({"detail": "Vai trò đã được cập nhật thành công."}, status=status.HTTP_200_OK)




class NotificationViewSet(viewsets.ModelViewSet):
    queryset = Notification.objects.all()
    serializer_class = NotificationSerializer

    @action(methods=['post'], detail=False, url_path='send', url_name='send')
    def send_notification(self, request):
        data = request.data
        title = data['title']
        message = data['message']
        user_id = data['user']

        # Find the user in the database
        try:
            user = User.objects.get(id=user_id)
        except User.DoesNotExist:
            return Response({"detail": "User does not exist."}, status=status.HTTP_400_BAD_REQUEST)

        recipient = user.email

        # Send the email
        try:
            send_mail(
                title,
                message,
                settings.EMAIL_HOST_USER,
                [recipient],
                fail_silently=False,
            )
        except Exception as e:
            return Response({"detail": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        # Save the notification in the database
        Notification.objects.create(
            title=title,
            user=user,
            message=message,
        )

        return Response({"detail": "Email sent successfully."}, status=status.HTTP_200_OK)


class CriteriaViewSet(viewsets.ModelViewSet):
    queryset = Criteria.objects.all()
    serializer_class = CriteriaSerializer

    @action(detail=True, methods=['get'])
    def specific_criterias(self, request, pk=None):
        criteria = self.get_object()
        specific_criterias = SpecificCriteria.objects.filter(criteria=criteria)
        serializer = SpecificCriteriaSerializer(specific_criterias, many=True)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        # Check if the user has the necessary permissions
        if not (request.user.is_superuser or request.user.groups.filter(name='Giáo vụ').exists()):
            return Response({"detail": "Bạn không có quyền tạo mới."}, status=status.HTTP_403_FORBIDDEN)

        return super().create(request, *args, **kwargs)


class SpecificCriteriaViewSet(viewsets.ModelViewSet):
    queryset = SpecificCriteria.objects.all()
    serializer_class = SpecificCriteriaSerializer


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [MultiPartParser, ]

    def get_permissions(self):
        if self.action in ['get_current_user']:
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['get'], url_path='current_user', detail=False)
    def get_current_user(self, request):
        return Response(UserSerializer(request.user).data)


class ScoreViewSet(viewsets.ModelViewSet):
    queryset = Score.objects.all()
    serializer_class = ScoreSerializer

    @action(methods=['post'], detail=False, url_path='grade', url_name='grade')
    def grade(self, request, *args, **kwargs):
        student_thesis_id = request.data.get('student_thesis')
        specific_criteria_id = request.data.get('specific_criteria')
        score_value = request.data.get('score')
        user_id = request.data.get('teacher_defense_commit')

        # Check if specific_criteria is provided
        if not specific_criteria_id:
            return Response({"detail": "Tiêu chí cụ thể là bắt buộc."}, status=status.HTTP_400_BAD_REQUEST)

        user = User.objects.get(id=user_id)

        # Get all the committees that the user is a member of
        committees = CommitteeMember.objects.filter(teacher_user=user)

        # Check if the score is between 0 and 10
        if not 0 <= score_value <= 10:
            return Response({"detail": "Score must be between 0 and 10."}, status=status.HTTP_400_BAD_REQUEST)

        # Check if the teacher is part of the ThesisDefenseCommittee of the selected student_thesis
        student_thesis = StudentDoThesis.objects.get(id=student_thesis_id)

        # Check if the student's thesis defense committee is in the teacher's committees
        if not committees.filter(thesis_defense_committee=student_thesis.thesis_defense_committee).exists():
            return Response(
                {
                    "detail": "Giáo viên phải là thành viên của Ủy ban bảo vệ luận văn của một sinh viên được chọn_luận án."},
                status=status.HTTP_400_BAD_REQUEST)

        if student_thesis.status == 'DN':
            return Response({"detail": "Chưa tới thời gian chấm điểm."}, status=status.HTTP_400_BAD_REQUEST)
        elif student_thesis.status == 'DCDX':
            return Response({"detail": "Đã qua thời gian chấm điểm."}, status=status.HTTP_400_BAD_REQUEST)

        # Check if the teacher has already scored this specific criteria for this student thesis
        existing_scores = Score.objects.filter(
            student_thesis=student_thesis,
            teacher_defense_commit__in=committees,
            specific_criteria=specific_criteria_id
        )
        if existing_scores.exists():
            return Response(
                {"detail": "Mỗi giáo viên chỉ được chấm một tiêu chí cụ thể một lần cho mỗi luận văn của sinh viên."},
                status=status.HTTP_400_BAD_REQUEST)

        # If all conditions are met, create the score
        data = request.data.copy()  # Copy the request data
        data['teacher_defense_commit'] = committees.first().id  # Replace the 'teacher_defense_commit' value

        serializer = self.get_serializer(data=data)  # Pass the modified data to the serializer
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class UnscoredCriteriaView(APIView):
    def get(self, request, student_do_thesis_id, user_id, format=None):
        # Check if the user is a CommitteeMember of the ThesisDefenseCommittee of the StudentDoThesis
        user = User.objects.get(id=user_id)
        student_do_thesis = StudentDoThesis.objects.get(id=student_do_thesis_id)
        if not CommitteeMember.objects.filter(teacher_user=user,
                                              thesis_defense_committee=student_do_thesis.thesis_defense_committee).exists():
            return Response({"detail": "Người dùng không có quyền chấm điểm."}, status=status.HTTP_403_FORBIDDEN)

        # Get all SpecificCriteria
        all_criteria = SpecificCriteria.objects.all()

        thesis_defense_committee = student_do_thesis.thesis_defense_committee

        # Check if the user is a CommitteeMember of the ThesisDefenseCommittee of the StudentDoThesis
        if not CommitteeMember.objects.filter(teacher_user=user,
                                              thesis_defense_committee=thesis_defense_committee).exists():
            return Response({"detail": "Người dùng không có quyền chấm điểm."}, status=status.HTTP_403_FORBIDDEN)

        # Get the CommitteeMember instance
        committee_member = CommitteeMember.objects.get(teacher_user=user,
                                                       thesis_defense_committee=thesis_defense_committee)

        # Get all SpecificCriteria scored by the specific CommitteeMember for the specific StudentDoThesis
        scored_criteria = Score.objects.filter(student_thesis_id=student_do_thesis_id,
                                               teacher_defense_commit=committee_member).values_list('specific_criteria',
                                                                                                    flat=True)
        # Filter out the SpecificCriteria that have not been scored
        unscored_criteria = all_criteria.exclude(id__in=scored_criteria)

        # Convert the QuerySet to a list of dictionaries for the response
        response_data = [{'id': criteria.id, 'name': criteria.name_specific_criteria} for criteria in unscored_criteria]

        # Return the data as a JSON response
        return Response(response_data)
