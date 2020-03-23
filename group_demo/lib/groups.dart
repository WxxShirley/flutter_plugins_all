import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:lpinyin/lpinyin.dart';

List _persons = [
  {'name': 'John','pinyin':'Team J'},
  {'name': '威尔','pinyin':'Team W'},
  {'name': '本','pinyin':'Team B'},
  {'name': 'Miranda','pinyin':'Team M'},
  {'name': 'mike','pinyin':'Team M'},
  {'name': 'Danny','pinyin':'Team D'},
  {'name':'如懿','pinyin':'Team R'},
];

class GroupViewD extends StatefulWidget
{
  @override
  createState() => GroupViewDemo();
}


class GroupViewDemo extends State<GroupViewD>
{
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    setState(() {
      _persons = _persons;
    });
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Group list view demo")),
      body: 
      SmartRefresher(

        enablePullDown: true,
        header:WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,

        child:
      GroupedListView<dynamic,String>(
        groupBy:(person) => PinyinHelper.getPinyinE(person['name']).substring(0,1).toUpperCase(),
        elements: _persons,
        order: GroupedListOrder.ASC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value)=>Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: 
          Row(children: <Widget>[
            Text(value,style: TextStyle(fontSize:20.0)),
            Container(child: Divider(height:2.0,color: Colors.grey,)),
          ],)
        ),
        itemBuilder: (c,person){
          return 
          Column(

          children: <Widget>[
            Container(child:ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal:20.0, vertical:10.0),
              leading: CircleAvatar(child:Text(person['name'][0],style:TextStyle(fontSize:18.0)),radius: 22.0,),
              title: Text(person['name'],style:TextStyle(fontSize:19.0)),
              onTap:(){

              }
            )),
            //Divider(),
             ],
          )
          ;
        },
      )
    ));
  }
}