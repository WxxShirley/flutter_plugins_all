import 'package:flutter/material.dart';
import 'package:card/samples.dart';
import 'package:card/models.dart';

class BuildCard extends StatefulWidget
{
  final Memo_Show memo;
  BuildCard({@required this.memo});
  

  @override
  createState() => _BuildCard(memo: memo);
}

class _BuildCard extends State<BuildCard>
{
   
   final Memo_Show memo;
   _BuildCard({@required this.memo});

   bool like = false;
   bool _offstage = true;
   
  @override
  Widget build(BuildContext context)
  {
    return new GestureDetector(
      child: Container(
        //height:200.0,
        margin: const EdgeInsets.symmetric(vertical:10.0,horizontal:10.0),
        /* 卡片外观渲染 */ 
        decoration: new BoxDecoration(
          color:Colors.white,
          shape:BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(2.0),
          // boxShadow
        ),

        /* 卡片内容部分 */
        /* 
           - 界面元素:
               row - 灰色：备忘发布的时间
               row - 黑色（较大字号，加醋）：备忘的题目
               row - 黑色 （普通字体）：备忘内容
               row - 灰色（location-Icon ,备忘地点）
               row - 用户头像、昵称、Like的icon
        */
        child: new Container(
           padding: EdgeInsets.fromLTRB(20.0, 15.0, 25.0, 5.0),
           child: Column(children: <Widget>[
               // 备忘发布的时间
              Row(children: <Widget>[Text("Day "+memo.time.toString().substring(0,19),style: TextStyle(color: Colors.grey, fontSize: 16.0,fontWeight: FontWeight.bold))],),
              Container(height:10.0),
               // 备忘的名称
              Row(children: <Widget>[Text(memo.memo_title,overflow: TextOverflow.ellipsis,style: TextStyle(color:Colors.pinkAccent,fontSize:20.0,fontWeight:FontWeight.bold),)],),
              Container(height:10.0),
               // 备忘描述文字 - 采用expaned来支持多行
              Row(children: <Widget>[Expanded(child:Text(memo.description,softWrap: true,overflow: TextOverflow.ellipsis,maxLines:5,style:TextStyle(color:Colors.black87,fontSize:15.0),) )],),
              Container(height:5.0),
               // 备忘地点
              Row(children: <Widget>[
                //Icon(Icons.location_on,color:Colors.greenAccent),
                //点击后显示map-view 这里仅以 text 模拟效果
                IconButton(icon:Icon(Icons.location_on,color:Colors.pink[200]),onPressed:(){
                     setState((){
                        if(_offstage==true) _offstage = false;
                        else if(_offstage==false) _offstage = true;
                     });
                }),
                Expanded(child:Text(memo.location,softWrap: true,style:TextStyle(color:Colors.pink[100],fontSize:14.0)),)
              ],) ,
                 Row(children: <Widget>[ Offstage(child: Text('show map'),offstage:_offstage )],),
               // 用户信息
               Row(children: <Widget>[
                 //用户头像
                ClipOval(child: Image(image:AssetImage(imgs[memo.img-1]),height:35.0,)), //用户头像
                 //用户昵称
                Container(width:200.0,child:Text(memo.nickname,style:TextStyle(color:Colors.black54,fontSize:16.0)),), //用户昵称
                 //star-icon 与 数量
                IconButton(icon:Icon(Icons.star),color: like==true? Colors.pink: Colors.grey, onPressed:(){
                  //star + 1
                  setState((){
                     if(like==false){
                       memo.likes += 1;
                       like = true;
                     }else{
                       memo.likes -=1;
                       like = false;
                     }
                  });
                }),
                Text(memo.likes.toString())
               ],)
            ],),
        ),
        
      )
    );
  } 
}


class CardPage extends StatefulWidget
{
  final List<Memo_Show> memos ;
  
  CardPage({@required this.memos});

  @override
  createState() => new _CardPage(memos: memos);
}

class _CardPage extends State<CardPage>
{
  final List<Memo_Show> memos;
  _CardPage({@required this.memos});
  
  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemCount: memos.length,
      itemBuilder:(context,index){
        return new BuildCard(memo: memos[index]);
      }
    );
  }
}