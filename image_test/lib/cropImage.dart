import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_test/globalVar.dart';
import 'package:image_crop/image_crop.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class CropImagePage extends StatefulWidget
{
  @override
  createState() => _CropImagePage();
}

class _CropImagePage extends State<CropImagePage>
{
  final cropKey = GlobalKey<CropState>();
  bool sure = false;
  File _file;
  bool show =false;
  File _f;
  String _url = "http://127.0.0.1:8000/get_img/";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title:Text('裁剪图片')),
      body: sure==false? Column(children: <Widget>[
        Expanded(child: Crop.file(img,key:cropKey),),
        Container(alignment: AlignmentDirectional.center,
         padding: const EdgeInsets.only(top:20.0),
         child: FlatButton(child:Text('crop'),onPressed:() async{
           // crop image
           //final scale = cropKey.currentState.scale;
           final area = cropKey.currentState.area;
           if(area!=null){
              _file = await ImageCrop.cropImage(file:img,area:area);
              setState(() {
                sure = true;
              });
              sure = true;
              print("file:");
           }
         })
        )
      ],):
      Container(alignment: Alignment.center,
      //child:Image(image:FileImage(_file)),
      child: Column(children: <Widget>[
        Image(image:FileImage(_file),height:100.0),
        RaisedButton(child:Text('send'),onPressed:() async{
           //send file to backend
           String _url = "http://127.0.0.1:8000/send_img/";
           Dio _dio = new Dio();
           String base64Image = base64Encode(_file.readAsBytesSync());
           String fileName = _file.path.split("/").last;
           http.Response res = await http.post(_url,body:{"image":base64Image,"name":fileName});
           print(res.toString());
           
        }),
        RaisedButton(child:Text('get img'),onPressed:()async{

         
          setState((){
            bool show = false;
          });
        }),
       Container(child:Image.network(_url,height:200.0))
      ],)
      )
      );
  }
}
