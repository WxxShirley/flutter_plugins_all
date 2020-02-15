from django.shortcuts import render
from img import models
# Create your views here.
import base64
import time
import os
from django.http import HttpResponse,JsonResponse

def uploadIMG(request):
    """
    接受前端的图片，并存储
    :param request:
    :return:
    """
    img_content = request.POST['image']
    img_name = request.POST['name']

    if img_name.split('.')[-1] not in ['jpeg','jpg','png']:
        return HttpResponse('file format error!')
    file_path = './static/img/' + str(int(time.time())) + '.'+img_name.split('.')[-1]


    with open(file_path,'wb+') as f:
        f.write(base64.b64decode(img_content))
    return HttpResponse('send img-file succ')

def getIMG(request):
    """
    接收图片名称，返回
    :param request:
    :return:
    """
    img_path = './static/img/1581779319.jpg'
    with open(img_path,'rb') as f:
        img_data = f.read()
    return HttpResponse(img_data,content_type = 'image/jpg')


