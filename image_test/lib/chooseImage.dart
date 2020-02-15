import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_test/globalVar.dart';
import 'package:image_test/cropImage.dart';


class ChooseImagePage extends StatefulWidget
{
  @override
  createState() => _ChooseImagePage();
}

class _ChooseImagePage extends State<ChooseImagePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text('从相机中选择图片')),
      body: Center(child:IconButton(icon:Icon(Icons.camera_alt),onPressed:()async{
           img = await ImagePicker.pickImage(source: ImageSource.gallery);
           if(img!=null){
             // crop img
             Navigator.push(context, new MaterialPageRoute(builder:(context) => new CropImagePage()));
           }
      }))
    );
  }
}