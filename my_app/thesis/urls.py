from django.urls import path, include
from . import views
from .admin import admin_site
from rest_framework.routers import DefaultRouter
from .views import UnscoredCriteriaView

router = DefaultRouter()
router.register('thesis', views.ThesisViewSet)
router.register('student_do_thesis', views.StudentDoThesisViewSet)
router.register('teacher_do_thesis', views.TeacherDoThesisViewSet)
router.register('thesis_defense_committee', views.ThesisDefenseCommitteeViewSet)
router.register('committee_member', views.CommitteeMemberViewSet)
router.register('score', views.ScoreViewSet)
router.register('notification', views.NotificationViewSet)
router.register('criteria', views.CriteriaViewSet)
router.register('specific_criteria', views.SpecificCriteriaViewSet)
router.register('users', views.UserViewSet)


# URLconfig
urlpatterns = [
    # path('hello/', views.say_hello),
    path('admin/', admin_site.urls),
    path('', include(router.urls)),
    path('o/', include('oauth2_provider.urls', namespace='oauth2_provider')),
    path('api/unscored_criteria/<int:student_do_thesis_id>/<int:user_id>/', UnscoredCriteriaView.as_view(),
         name='unscored_criteria'),
]
