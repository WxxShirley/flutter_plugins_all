import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


class ImageTest extends StatefulWidget
{
  @override
  _ImageTest createState() => _ImageTest();
}

class _ImageTest extends State<ImageTest>
{
  File _image;
  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState((){
       _image = image;
    });
  }

  Future getPicture() async{
     await ImagePicker.pickImage(source: ImageSource.gallery).then((image)=>cropImage(image));
    
  }

  void cropImage(File originalImage) async{
    //String result = await Navigator.push(context,MaterialPageRoute(builder:(context)=>CropImage(originalImage)));
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker Example'),),
      body: Center(
        child: _image == null ? Text('No image selected.'): Image.file(_image),
      ),
      bottomNavigationBar: BottomAppBar(child: 
        Row(children: <Widget>[
          IconButton(icon: Icon(Icons.add_a_photo),tooltip: 'Pick Image',onPressed:getImage),
          IconButton(icon:Icon(Icons.image),tooltip: 'Choose from photos',onPressed:getPicture),
        ],)
      ),
    );
  }

}