import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:map_test/search.dart';


class MapPage extends StatefulWidget
{
  @override
  _MapPage createState() => _MapPage();
}

class _MapPage extends State<MapPage>{
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: new AppBar(
      leading: IconButton(icon:Icon(Icons.arrow_left),onPressed:(){
        Navigator.push(context, new MaterialPageRoute(builder:(context) => new SearchPoi()));

      }),
      title: Text('地图测试',style:TextStyle(fontSize:20.0)),),
      body:
       Container(
         child: Column(children: <Widget>[
           new Container(height:20.0),
           new MapWidget(),
         ],)
       )
      );
  }
}

class MapWidget extends StatefulWidget
{
   @override
   _MapWidget createState() => _MapWidget();
}

class _MapWidget extends State<MapWidget>
{
  AmapController _controller;
  Widget build(BuildContext context){
    return Container(alignment: Alignment.center,
     height:500.0,
     decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow:<BoxShadow>[
          new BoxShadow(color:Colors.black12,blurRadius: 10.0,offset:new Offset(0.0,10.0),)
        ]
      ),
      child: SizedBox(
        width:500.0,
        height:250.0,
        child:
        AmapView(
         mapType: MapType.Standard,
         showZoomControl: true,
         showCompass:true,
         zoomGesturesEnabled:true,
         zoomLevel: 5,
         centerCoordinate:LatLng(34.828,119.150),
         markers: <MarkerOption>[MarkerOption(latLng:LatLng(34.849,119.131))],
         onMapCreated:(controller) async{
          _controller = controller;
          //_controller.addMarker(MarkerOption(latLng:LatLng(39,116.3)));
         }
        ),
      ),
    );
  }
}