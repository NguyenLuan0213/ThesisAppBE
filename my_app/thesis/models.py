from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import AbstractUser
from django.core.exceptions import ValidationError
from django.db import models
from django import forms
from django.core.validators import MinValueValidator, MaxValueValidator


# Create your models here.
class User(AbstractUser):
    avatar = models.ImageField(upload_to='user/%Y/%m', default=None)


    def __str__(self):
        return self.username + ' /' + self.first_name + ' ' + self.last_name

# class ItemBase(models.Model):
#     class Meta:
#         abcstract = True
#
#     image = models.ImageField(upload_to='items/%Y/%m', default='')
#     name = models.CharField(max_length=50)


class Notification(models.Model):
    class Meta:
        db_table = 'notification'

    title = models.CharField(max_length=50, null=True, blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    message = models.TextField()
    date_created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.message


class Thesis(models.Model):
    class Meta:
        db_table = 'thesis'

    title = models.CharField(max_length=50, null=False)
    product = models.FileField(upload_to='thesis/%Y/%m', default=None, null=True)
    report = models.FileField(upload_to='thesis/%Y/%m', default=None, null=True)
    date_created = models.DateTimeField(auto_now_add=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.title


class StudentDoThesis(models.Model):
    class Meta:
        db_table = 'student_do_thesis'
        unique_together = ('student', 'thesis')

    STATUS_CHOICES = [
        ('DN', 'Đã nộp'),
        ('DCD', 'Đang chấm điểm'),
        ('DCDX', 'Đã chấm điểm xong'),
    ]

    student = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='students_user', null=True)
    thesis = models.ForeignKey(Thesis, on_delete=models.SET_NULL, related_name='students_thesis', null=True)
    thesis_defense_committee = models.ForeignKey('ThesisDefenseCommittee', on_delete=models.SET_NULL, related_name='students_thesis_defense_committee', null=True)
    date_created = models.DateTimeField(auto_now_add=True)
    active = models.BooleanField(default=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='DN')
    count_score = models.FloatField(default=0.0, null=True, blank=True)
    results = models.TextField(null=True, blank=True)

    def clean(self):
        super().clean()
        if self.pk is None:  # New instance
            # Check for existing theses in the same committee
            existing_theses_count = StudentDoThesis.objects.filter(
                thesis_defense_committee=self.thesis_defense_committee).count()
            if existing_theses_count >= 5:
                raise ValidationError('Hội đồng khóa luận đã đầy, mời xem lại.')

            # Check if there is any record existing with the same thesis and student
            existing_count = StudentDoThesis.objects.filter(thesis=self.thesis, student=self.student).count()
            if existing_count > 0:
                raise ValidationError('Không được tham gia 2 lần trên cùng 1 khóa luận.')

    def save(self, *args, **kwargs):
        if self._state.adding:  # Chỉ kiểm tra khi thêm mới bản ghi
            max_students_per_thesis = 2
            current_student_count = StudentDoThesis.objects.filter(thesis=self.thesis).count()

            if current_student_count >= max_students_per_thesis:
                raise ValidationError('Đồ án này đã đầy học sinh, yêu cầu kiểm tra và chọn đúng đồ án.')

        super().save(*args, **kwargs)

    def __str__(self):
        return self.thesis.title + ' /' + self.student.first_name + ' ' + self.student.last_name


class TeacherDoThesis(models.Model):
    class Meta:
        db_table = 'teacher_do_thesis'
        unique_together = ('teacher', 'thesis_student')

    teacher = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='teachers_user', null=True)
    thesis_student = models.ForeignKey(StudentDoThesis, on_delete=models.SET_NULL, related_name='teacher_student_thesis', null=True)
    date_join = models.DateTimeField(auto_now_add=True)

    def clean(self):
        super().clean()
        if self.pk is None:  # New instance, check for existing teachers for the same thesis
            existing_teachers_count = TeacherDoThesis.objects.filter(thesis_student=self.thesis_student).count()
            if existing_teachers_count >= 2:
                raise ValidationError('Đồ án này đã dầy học sinh, yêu cầu xem lại.')

    def __str__(self):
        return self.teacher.username


class ThesisDefenseCommittee(models.Model):
    class Meta:
        db_table = 'thesis_defense_committee'

    name = models.CharField(max_length=50, null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True)
    date_end = models.DateTimeField(null=True)


    def __str__(self):
        return self.name


class CommitteeMember(models.Model):
    class Meta:
        db_table = 'committee_member'

    ROLE_CHOICES = [
        ('CT', 'Chủ tịch'),
        ('TK', 'Thư ký'),
        ('TV', 'Thành viên'),
    ]

    teacher_user = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='teacher_user', null=True)
    thesis_defense_committee = models.ForeignKey(ThesisDefenseCommittee, on_delete=models.SET_NULL, related_name='teacher_tdc_thesis', null=True)
    date_join = models.DateTimeField(auto_now_add=True)
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='TV')

    def clean(self):
        super().clean()
        if self.pk is None:  # New instance, check for existing members in the same committee
            existing_members_count = CommitteeMember.objects.filter(thesis_defense_committee=self.thesis_defense_committee).count()
            if existing_members_count >= 5:
                raise ValidationError('Hội đồng này đã đầy thành viên mời xem lại.')

    def __str__(self):
        return self.thesis_defense_committee.name + ' ' + self.role + ' ' + self.teacher_user.first_name + ' ' + self.teacher_user.last_name


class Criteria(models.Model):
    class Meta:
        db_table = 'criteria'

    name_title = models.CharField(max_length=50, null=False)
    description = models.TextField(null=True)

    def __str__(self):
        return self.name_title


class SpecificCriteria(models.Model):
    class Meta:
        db_table = 'specific_criteria'

    name_specific_criteria = models.CharField(max_length=50, null=False)
    criteria = models.ForeignKey(on_delete=models.SET_NULL, related_name='specific_criteria', null=True, to = Criteria)
    points_1 = models.TextField(null=True, blank=True)
    points_2 = models.TextField(null=True, blank=True)
    points_3 = models.TextField(null=True, blank=True)
    points_4 = models.TextField(null=True, blank=True)
    points_5 = models.TextField(null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.name_specific_criteria

class Score(models.Model):
    class Meta:
        db_table = 'score'

    student_thesis = models.ForeignKey(StudentDoThesis, on_delete=models.SET_NULL, related_name='score_thesis', null=True)
    teacher_defense_commit = models.ForeignKey(CommitteeMember, on_delete=models.SET_NULL, related_name='score_committee_member', null=True)
    specific_criteria = models.ForeignKey(SpecificCriteria, on_delete=models.SET_NULL, related_name='score_specific_criteria', null=True)
    score = models.FloatField(null=False, default=0.0, validators=[MinValueValidator(0.0), MaxValueValidator(10.0)])
    date_created = models.DateTimeField(auto_now_add=True)

    def clean(self):
        if not 0 <= self.score <= 10:
            raise ValidationError("Score must be between 0 and 10.")


    def __str__(self):
        return self.student_thesis.student.first_name + ' ' + self.student_thesis.student.last_name+ ' ' + str(self.score)