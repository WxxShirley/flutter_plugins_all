import 'package:flutter/material.dart';

const String NAME = "WU";

// 聊天页面的主界面
class ChatScreen extends StatefulWidget
{
  @override
  createState() => ChatScreenState();
}


// 单个聊天界面
class ChatMessage extends StatelessWidget{
   final String text;
   final AnimationController animationController;
   ChatMessage({this.text,this.animationController});
   
   @override
   Widget build(BuildContext context){
     return new SizeTransition(
       sizeFactor: new CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
       axisAlignment: 0.0,
       child: new Container(
         margin: const EdgeInsets.symmetric(vertical:10.0),
         child: new Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             new Container(margin:const EdgeInsets.only(right:16.0),
               child: new CircleAvatar(child: new Text(NAME[0]))
             ),
             new Expanded(child: new Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 new Text(NAME,style: Theme.of(context).textTheme.subhead),
                 new Container(
                   margin: const EdgeInsets.only(top:5.0),
                   child: new Text(text)
                 )
               ],
             )
             )
           ],
           )
       )
     );
   }

}



class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
   
  final List<ChatMessage> chatMessages = <ChatMessage>[];
   
  final TextEditingController textEditingController = new TextEditingController();

  bool _isComposing = false;
   
  void handleSubmitted(String text){
    textEditingController.clear();
    setState(() {
      _isComposing = false;
    });

    ChatMessage chatMessage = new ChatMessage(
      text: text,
      animationController: new AnimationController(duration: new Duration(milliseconds: 2000),vsync:this)
    );
    setState(() {
      chatMessages.insert(0,chatMessage);
    });
    
    chatMessage.animationController.forward();

  } 


  // 定义文本输入框的控件
  Widget _fixTextWidget(){
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal:8.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Flexible(
            child: new TextField(
               controller: textEditingController,
               onChanged: (String text){
                 setState(() {
                   _isComposing = text.length > 0;
                 });
               },
               decoration: new InputDecoration.collapsed(hintText: "Send a message"),
               onSubmitted: handleSubmitted,
            ),),
         new Container(
           margin: const EdgeInsets.symmetric(horizontal:4.0),
           child: new IconButton(icon:new Icon(Icons.send),onPressed:_isComposing?()=>handleSubmitted(textEditingController.text):null),
         )
        ],
      )
    );
  }
  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title:new Text("Friendlychat"),),
      body: new Column(children:<Widget>[
        new Flexible(
          child: new ListView.builder(padding: new EdgeInsets.all(8.0),
            reverse:true,
            itemBuilder: (BuildContext context, int index)=> chatMessages[index],
            itemCount: chatMessages.length,
          ),
        ),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color:Theme.of(context).cardColor),
          child: _fixTextWidget()
        )
      ])
    );
  }

}