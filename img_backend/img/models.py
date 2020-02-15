from django.db import models

# Create your models here.

class Img(models.Model):
    user = models.CharField(max_length=256)
    img_path = models.CharField(max_length=256)