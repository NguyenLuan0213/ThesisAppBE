from django.db.models import Count
from django.utils import timezone
from .models import StudentDoThesis
from django.db.models import Count

def count_passed_students_by_quarter(year):
    counts = {}
    for quarter in range(1, 5):
        # Calculate the start and end months of the quarter
        start_month = (quarter - 1) * 3 + 1
        end_month = start_month + 3

        # Count the students with 'Đạt' results in the quarter
        start_date = timezone.datetime(year, start_month, 1)
        end_date = timezone.datetime(year, end_month, 1) if end_month <= 12 else timezone.datetime(year + 1, 1, 1)
        count = StudentDoThesis.objects.filter(
            results='Đạt',
            date_created__range=(start_date, end_date)
        ).count()

        # Add the count to the dictionary
        counts[quarter] = count

    return counts


def count_fail_student():
    return StudentDoThesis.objects.filter(results='Không đạt').count()

def count_students_do_thesis():
    return StudentDoThesis.objects.filter(active=True).count()
