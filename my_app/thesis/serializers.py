from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from .models import StudentDoThesis, Thesis, TeacherDoThesis, ThesisDefenseCommittee, CommitteeMember, Score, Notification, User, Criteria, SpecificCriteria


class ThesisSerializer(ModelSerializer):
    product = serializers.FileField()
    report = serializers.FileField()

    class Meta:
        model = Thesis
        fields = ['id', 'title', 'product', 'report', 'date_created', 'active']

    # def get_product(self, obj):
    #     request = self.context.get('request')
    #     product_url = obj.product.url
    #     return request.build_absolute_uri('/static' + product_url)
    #
    # def get_report(self, obj):
    #     request = self.context.get('request')
    #     report_url = obj.report.url
    #     return request.build_absolute_uri('/static' + report_url)


class UserSerializer(ModelSerializer):
    extra_kwargs = {
        'password': {
            'write_only': True
        }
    }
    class Meta:
        model = User
        fields = ['id', 'username', 'avatar', 'email', 'first_name', 'last_name', 'password']

    def create(self, validated_data):
        data = validated_data.copy()
        user = User(**data)
        user.set_password(data['password'])
        user.save()

        return user


class StudentDoThesisSerializer(serializers.ModelSerializer):
    student_name = serializers.SerializerMethodField()

    class Meta:
        model = StudentDoThesis
        fields = ['id', 'student_name', 'thesis', 'thesis_defense_committee', 'date_created', 'status', 'count_score', 'active', 'student']

    def get_student_name(self, obj):
        return obj.student.first_name + ' ' + obj.student.last_name


class TeacherDoThesisSerializer(serializers.ModelSerializer):
    teacher_name = serializers.SerializerMethodField()

    class Meta:
        model = TeacherDoThesis
        fields = ['id', 'teacher_name', 'thesis_student', 'date_join']

    def get_teacher_name(self, obj):
        return obj.teacher.first_name + ' ' + obj.teacher.last_name


class ThesisDefenseCommitteeSerializer(ModelSerializer):
    class Meta:
        model = ThesisDefenseCommittee
        fields = ['id', 'name', 'date_created', 'date_end']


class CommitteeMemberSerializer(ModelSerializer):
    teacher_name = serializers.SerializerMethodField()

    class Meta:
        model = CommitteeMember
        fields = ['id', 'date_join', 'role', 'thesis_defense_committee', 'teacher_user', 'teacher_name']

    def get_teacher_name(self, obj):
        return obj.teacher_user.first_name + ' ' + obj.teacher_user.last_name


class ScoreSerializer(ModelSerializer):
    class Meta:
        model = Score
        fields = ['id', 'score', 'date_created', 'specific_criteria', 'teacher_defense_commit', 'student_thesis']


class NotificationSerializer(ModelSerializer):
    class Meta:
        model = Notification
        fields = ['id', 'title', 'user', 'message', 'date_created',]


class CriteriaSerializer(ModelSerializer):
    class Meta:
        model = Criteria
        fields = ['id', 'name_title', 'description']


class SpecificCriteriaSerializer(ModelSerializer):
    class Meta:
        model = SpecificCriteria
        fields = ['id', 'name_specific_criteria', 'criteria', 'points_1', 'points_2', 'points_3', 'points_4', 'points_5', 'date_created', 'active']



