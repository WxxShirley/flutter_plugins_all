import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:map_test/map.dart';
import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:map_test/search.dart';

void main() {
  //AmapService.init(iosKey: "85753c27c4aa9a0f1989f90bfe300317",androidKey: "85753c27c4aa9a0f1989f90bfe300317");
  WidgetsFlutterBinding.ensureInitialized();
  AmapCore.init('85753c27c4aa9a0f1989f90bfe300317');
  AmapService.init(iosKey: "85753c27c4aa9a0f1989f90bfe300317",androidKey: "85753c27c4aa9a0f1989f90bfe300317");
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: MapPage(),
          //SearchPoi(),
      )
    );
  }
}

