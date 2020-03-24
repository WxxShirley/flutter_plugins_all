from django.shortcuts import render

from dwebsocket import require_websocket
from django.http import HttpResponse

# Create your views here.

all_conn = {}

@require_websocket
def server(request,user_id):
    if request.is_websocket():
       try:
           while 1:
               message = request.websocket.wait()
               all_conn[str(user_id)] = request.websocket
               if message:
                   request.websocket.send(message)
       except Exception as e:
           print(e)
           request.websocket.close()
           return



def call(pipe):
    pipe.send("succ")


def test(request):
    for soc in all_conn.keys():
        print("send")
        all_conn[soc].send("new info")
    return HttpResponse("succ")