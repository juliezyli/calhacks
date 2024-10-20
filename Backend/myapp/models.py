from django.db import models

## file used as a model for all data collected
class UserPreference(models.Model):
    user_id = models.CharField(max_length = 100, unique = True)
    preferences_metadata = models.JSONField(null = True, blank = True)
    time_created = models.DateTimeField(auto_now_add = True)