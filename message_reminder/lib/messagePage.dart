import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:message_reminder/model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class BuildMessage extends StatefulWidget
{
  final Message msg;
  BuildMessage({this.msg});

  @override
  createState() => _BuildMessage(msg:msg);
}

class _BuildMessage extends State<BuildMessage>
{
   final Message msg;
   _BuildMessage({this.msg});

   String content;

   void initState(){
     if(msg.type==1){
       content = msg.his_nickname + " 关注了你";
     }else {
       content = msg.his_nickname + " 点赞了你的备忘:";
     }
   }
  
   Widget build(BuildContext)
   {
     return msg.type==1? Container(
       padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, .0),
       child:Column(children: <Widget>[
        Row(
         children: <Widget>[
           GestureDetector(child:ClipOval(child:Image(image:AssetImage(msg.his_profile),height:50.0)),onTap: (){
             //personal page
           },),
           Container(width:20.0),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text(content.length<=25? content: content.substring(0,20)+"...",style:TextStyle(fontSize:16.0)),
               Container(height:5.0),
               Text(msg.time.toString().substring(0,19),style: TextStyle(color:Colors.grey))]),
       ],),
       Divider(),
       ])): 
       Container(
       padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, .0),
       child:Column(children: <Widget>[
        Row(
         children: <Widget>[
           GestureDetector(child:ClipOval(child:Image(image:AssetImage(msg.his_profile),height:50.0)),onTap: (){
             //personal page
           },),
           Container(width:20.0),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text(content.length<=25? content: content.substring(0,20)+"...",style:TextStyle(fontSize:16.0)),
               //Container(height:5.0),
               Text(msg.memo_title, style: TextStyle(color: Colors.blueAccent,fontSize:16.0)),
               Text(msg.time.toString().substring(0,19),style: TextStyle(color:Colors.grey))]),
       ],),
       Divider(),
       ]));
   }
}


//实时刷新
class MessagePage extends StatefulWidget
{
  final List<Message> msgs;
  MessagePage(this.msgs);

  @override
  createState() => _MessagePage(msgs);
}

class _MessagePage extends State<MessagePage>
{
   List<Message> msgs;
  _MessagePage(this.msgs);
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  BuildContext currentContext;
  int currentIndex;

  void _onLoading() async{
    await Future.delayed(Duration(microseconds:10000 ));
    _refreshController.loadComplete();
  }

  void _onFresh() async{
    setState((){
      msgs = msgs;
    });
    _refreshController.refreshCompleted();
  }

  void _handleTap(BuildContext context, int index) {
    //删除该条提示消息
    //同时在后端执行 models.XX.objects.filter(...).delete()
    msgs.removeAt(index);
    setState((){
      msgs = msgs;
    });
  }

  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Messages")),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer:CustomFooter(
          builder: (BuildContext context, LoadStatus mode){
              Widget body;
              if(mode==LoadStatus.idle){body = Text("上拉加载");}
              else if(mode==LoadStatus.loading){body = CupertinoActivityIndicator();}
              else if(mode==LoadStatus.failed){body = Text("松手，加载更多！");}
              else {body = Text("没有更多数据了");}
              return Container(height:40.0,child:Center(child:body));
            }
        ),
        controller: _refreshController,
        onRefresh: _onFresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemCount: msgs.length,
          //itemBuilder: (context,index)=>BuildMessage(msg:msgs[index]),
          itemBuilder: (context,index){
              currentIndex = index;
              currentContext = context;
              return Slidable(
                  key: ValueKey(index),
                  actionPane: SlidableDrawerActionPane(),
                  actions: <Widget>[
                    Container(padding: EdgeInsets.symmetric(vertical:10.0,horizontal:.0),
                      child: IconSlideAction(caption:'删除',
                        color: Colors.red, 
                        icon: Icons.delete,
                        onTap:(){_handleTap(context,index);}
                      )
                    )
                  ],
                  child: new BuildMessage(msg:msgs[index]),
              );
          }
        )
      )
    );
  }


}