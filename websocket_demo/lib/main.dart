import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:websocket_demo/socket_page.dart';

void main() => runApp(MyApp());





class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
