import 'package:flutter/material.dart';
import 'package:contacts/model.dart';

class PersonalPage extends StatelessWidget
{
  
  final Friend user;
  PersonalPage({@required this.user});

  Widget _buildHeader(Friend user){
    return Center(
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0),
          child: Text(user.name,textScaleFactor: 1.2,)
          )
      ],)
    );
  }


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_left),onPressed: (){Navigator.pop(context);},),
        title: Text("Personal Page")
      ),
      body: _buildHeader(user),
    );
  }

}