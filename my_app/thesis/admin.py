from django.contrib import admin
from django import forms
from django.contrib.auth.models import Group, Permission
from django.utils.html import mark_safe, format_html
from .models import StudentDoThesis, Thesis, TeacherDoThesis, ThesisDefenseCommittee, CommitteeMember, Score, Notification, User, Criteria, SpecificCriteria
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.core.exceptions import ValidationError
from oauth2_provider.models import Application, Grant, AccessToken, RefreshToken, IDToken
from django.core.validators import MinValueValidator, MaxValueValidator




class TeacherDoThesisInline(admin.StackedInline):
    model = TeacherDoThesis
    extra = 0  # Số lượng form rỗng sẽ hiển thị mặc định (không có form rỗng)
    max_num = 2  # Số lượng form tối đa được hiển thị


class StudentDoThesisSite(admin.ModelAdmin):
    list_display = ["id", "student_id", "thesis_id", "thesis_defense_committee", "date_created", "active", "status", "count_score"]
    inlines = (TeacherDoThesisInline,)


class ThesisStudentInline(admin.StackedInline):
    model = StudentDoThesis
    extra = 0  # Số lượng form rỗng sẽ hiển thị mặc định (không có form rỗng)
    max_num = 2  # Số lượng form tối đa được hiển thị


class ThesisSite(admin.ModelAdmin):

    list_display = ["id", "title", "date_created", "active"]
    search_fields = ["title", "date_created"]
    list_filter = ["active"]
    inlines = (ThesisStudentInline, )

    # Định nghĩa hàm hiển thị nội dung trường
    def display_product(self, obj):
        if obj.product:  # Kiểm tra xem trường product có giá trị không
            return format_html('<a href="/static{}">{}</a>', obj.product.url, obj.product.name)
        else:
            return "No file"  # Trả về thông báo nếu không có tệp tin

    def display_report(self, obj):
        if obj.report:  # Kiểm tra xem trường report có giá trị không
            return format_html('<a href="/static{}">{}</a>', obj.report.url, obj.report.name)
        else:
            return "No file"  # Trả về thông báo nếu không có tệp tin

    # Đặt tên cho cột hiển thị trong danh sách
    display_product.short_description = "Product File"
    display_report.short_description = "Report File"

    # Thêm trường hiển thị vào list_display để hiển thị trong danh sách
    list_display = ["id", "title", "date_created", "active", "display_product", "display_report"]


class UserSite(admin.ModelAdmin):
    list_display = ["id", "image", "first_name", "last_name","last_login","is_staff", "is_superuser", "email", "date_joined"]

    readonly_fields = ["image"]

    def image(self, User):
        return mark_safe('''
        <img src='/static/{img_url}' width="100" height="100" alt='{alt}'>
        '''.format(img_url=User.avatar.name, alt=User.avatar))


class TeacherDoThesisSite(admin.ModelAdmin):
    list_display = ["id", "teacher", "thesis_student_id", "get_thesis_title", "date_join"]

    def get_thesis_title(self, obj):
        return obj.thesis_student.thesis.title if obj.thesis_student and obj.thesis_student.thesis else None

    get_thesis_title.short_description = 'Thesis Title'


class CriteriaSite(admin.ModelAdmin):
    list_display = ["id", "name_title", "description"]


# Register your models here.
class SpecificCriteriaForm(forms.ModelForm):
    points_1 = forms.CharField(widget=CKEditorUploadingWidget())
    points_2 = forms.CharField(widget=CKEditorUploadingWidget())
    points_3 = forms.CharField(widget=CKEditorUploadingWidget())
    points_4 = forms.CharField(widget=CKEditorUploadingWidget())
    points_5 = forms.CharField(widget=CKEditorUploadingWidget())
    class Meta:
        model = SpecificCriteria
        fields = '__all__'


class SpecificCriteriaSite(admin.ModelAdmin):
    list_display = ["id", "name_specific_criteria", "criteria_id", "points_1_display", "points_2_display",
                    "points_3_display", "points_4_display", "points_5_display", "date_created", "active"]

    def points_1_display(self, obj):
        return mark_safe(obj.points_1) if obj.points_1 else ''

    points_1_display.short_description = "Điểm 10"

    def points_2_display(self, obj):
        return mark_safe(obj.points_2) if obj.points_2 else ''

    points_2_display.short_description = "Điểm 7.5"

    def points_3_display(self, obj):
        return mark_safe(obj.points_3) if obj.points_3 else ''

    points_3_display.short_description = "Điểm 5"

    def points_4_display(self, obj):
        return mark_safe(obj.points_4) if obj.points_4 else ''

    points_4_display.short_description = "Điểm 2.5"

    def points_5_display(self, obj):
        return mark_safe(obj.points_5) if obj.points_5 else ''

    points_5_display.short_description = "Điểm 0"
    form = SpecificCriteriaForm


class ThesisDefenseCommitteeSite(admin.ModelAdmin):
    list_display = ["id", "name", "date_created", "date_end"]


class CommitteeMemberSite(admin.ModelAdmin):
    list_display = ["id", "teacher_user", "thesis_defense_committee", "date_join", "role"]


class ScoreSite(admin.ModelAdmin):
    list_display = ["id", "score", "specific_criteria", "teacher_defense_commit_id", "date_created", "student_thesis"]


class NotificationSite(admin.ModelAdmin):
    list_display = ["id", "title", "message", "user", "date_created"]


class ThesisAdminSite(admin.AdminSite):
    site_header = "HỆ THỐNG QUẢN LÝ LUẬN VĂN"
    site_title = "Hệ thống quản lý luận văn"
    index_title = "Hệ thống quản lý luận văn"


admin_site = ThesisAdminSite(name='thesisAppAdmin')

admin_site.register(Criteria, CriteriaSite)
admin_site.register(Thesis, ThesisSite)
admin_site.register(TeacherDoThesis, TeacherDoThesisSite)
admin_site.register(ThesisDefenseCommittee, ThesisDefenseCommitteeSite)
admin_site.register(StudentDoThesis, StudentDoThesisSite)
admin_site.register(CommitteeMember, CommitteeMemberSite)
admin_site.register(Score, ScoreSite)
admin_site.register(Notification, NotificationSite)
admin_site.register(User, UserSite)
admin_site.register(SpecificCriteria, SpecificCriteriaSite)
admin_site.register(Group)
admin_site.register(Application)
admin_site.register(Grant)
admin_site.register(AccessToken)
admin_site.register(RefreshToken)
admin_site.register(IDToken)

# admin.site.register(Criteria, CriteriaSite)
# admin.site.register(Thesis, ThesisSite)
# admin.site.register(TeacherDoThesis, TeacherDoThesisSite)
# admin.site.register(ThesisDefenseCommittee, ThesisDefenseCommitteeSite)
# admin.site.register(StudentDoThesis, StudentDoThesisSite)
# admin.site.register(CommitteeMember)
# admin.site.register(Score)
# admin.site.register(Notification)
# admin.site.register(User, UserSite)
# admin.site.register(SpecificCriteria, SpecificCriteriaSite)
