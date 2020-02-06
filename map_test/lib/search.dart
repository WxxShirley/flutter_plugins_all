import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:map_test/map.dart';


class SearchPoi extends StatefulWidget
{
  @override
  _SearchPoi createState() => new _SearchPoi();
}

class _SearchPoi extends State<SearchPoi>
{
  
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _locController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();
  
  AmapController _controller;
  double _zoom = 5.0;
  List<Poi> result = [];
  List<String> _poiTitleList = [];

  //函数，返回为包含TextFormField的Container
  Container buildInput(double height,String hintText,TextEditingController _controller,Icon icon,bool isAutoFocus,String validator_text)
  {
    return Container(alignment: Alignment.center,
      height:height,
      padding: EdgeInsets.symmetric(horizontal:10.0,vertical:10.0),
      child: TextFormField(
        autofocus: isAutoFocus,
        controller: _controller,
        decoration: InputDecoration(prefixIcon: icon,hintText:hintText),
        validator: (String value){
          if(value.isEmpty){
            return validator_text;
          }
        },
      )
    );
  }
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon:Icon(Icons.chevron_left,size:28.0),onPressed:(){
        Navigator.push(context, new MaterialPageRoute(builder:(context) => new MapPage()));
      }),
      title: Text('搜索功能测试'),),
      body: Form(
        key:_formkey,
        child: ListView(
          children: <Widget>[
            Container(height:10.0),
            buildInput(50.0,'城市名',_cityController,Icon(Icons.location_city),true,"城市名不能为空"),
            buildInput(50.0,"地点名",_locController,Icon(Icons.search),false,"地点不能为空"),

            buildConfirmButton(context),

            buildMapView(context),
            
            //buildSearchAround(context),
          ],
        )
      )
    );
  }

  Container buildConfirmButton(BuildContext context)
  {
    return Container(
      width:200.0,
      alignment: Alignment.center,
      child:RaisedButton(
        child: Text("确定"),
        onPressed:() async{

           if(_locController.text.isNotEmpty && _cityController.text.isNotEmpty){
             print("城市:"+_locController.text);
             print("关键字:"+_cityController.text);

             result = await AmapSearch.searchKeyword(_locController.text,city:_cityController.text);
            
               if(result.isNotEmpty){
          List _poiResult  = [];
          for(int i=0;i<result.length;i++)
          {
            String loc = await result[i].address;
            String title = await result[i].title;
            LatLng latlng = await result[i].latLng;
            String province = await result[i].provinceName;
            String city = await result[i].cityName;
            _poiResult.add({"location":loc,"title":title,"latlng":latlng,"province":province,"city":city});
           }
           
           //点击底部弹窗展示搜索结果
           showModalBottomSheet(
            context:context,
            builder: (context)=>Container(
            child: ListView.builder(
              itemCount: result.length>20? 20:result.length,
              itemBuilder:(context,index) {
                return new GestureDetector(
                  child: new Container(
                  padding: EdgeInsets.symmetric(vertical:.0,horizontal: 5.0),
                  child: Column(children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(padding:EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0),child:Icon(Icons.location_city,color:Theme.of(context).accentColor)),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(_poiResult[index]["title"],overflow: TextOverflow.ellipsis,style:TextStyle(fontSize: 16.0,)),
                            Text(_poiResult[index]["location"],overflow:TextOverflow.ellipsis,style:TextStyle(fontSize:14.0,color:Colors.grey,fontStyle:FontStyle.italic)),

                         ],),
                        ],
                      ),
                      Divider(height:8.0,color:Colors.grey,),
                   ],)),
                onTap: (){
                  showDialog(context:context,builder:(context)=>AlertDialog(
                    title: Text('提示'),
                    content: Text('选择这个地点吗？'),
                    actions: <Widget>[
                     FlatButton(child: Text('确定'),onPressed:() async {
                      _controller.addMarker(MarkerOption(latLng:_poiResult[index]["latlng"]));
                     
                       Navigator.pop(context);
                      }),
                      FlatButton(child:Text('取消'),onPressed:(){Navigator.pop(context);})
                      ],));
                      });
                       }
                        )
                      )
                      );
                  }else{
                  showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return new AlertDialog(
                        title: new Text('提示'),
                        content: new Text('查找结果为空'),
                        actions: <Widget>[
                        new FlatButton(
                          child: new Text('确定'),
                          onPressed: (){Navigator.of(context).pop();
                    })]);});
                  }

           }
        }
      )
    );
  }

  SizedBox buildMapView(BuildContext context)
  {
    return SizedBox(
      width:500.0,
      height:200.0,
      child:Container(
        child: AmapView(
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

        )
      )
    );
  } 

  RaisedButton buildSearchAround(BuildContext context)
  {
     
    RaisedButton(
            onPressed: () async {
              final poiList = await AmapSearch.searchKeyword(
                _locController.text,city:_cityController.text
              );

              Stream.fromIterable(poiList)
                  .asyncMap((it) async =>
                      'title: ' +
                      (await it.title) +
                      ', address: ' +
                      (await it.address) +
                      ', businessArea: ' +
                      (await it.businessArea) +
                      ', ' +
                      (await it.latLng).toString())
                  .toList()
                  .then((it) => setState(() => _poiTitleList = it));
            },
            child: Text('搜索'),
          );
  }
  
}