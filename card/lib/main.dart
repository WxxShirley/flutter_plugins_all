import 'package:flutter/material.dart';
import 'package:card/cardpage.dart';
import 'package:card/samples.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink, ),
     // home: MyHomePage(title: 'Flutter Demo Home Page'),
     home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget
{
  @override
  createState() => new _MainPage();
}

class _MainPage extends State<MainPage>
{
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title:Text('Friends Moments')),
      body: new CardPage(memos:memos),
    );
  }
}