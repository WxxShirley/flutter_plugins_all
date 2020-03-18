

import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';


class ButtonScreen extends StatefulWidget
{
  @override
  createState() => _ButtonScreen();
}

class _ButtonScreen extends State<ButtonScreen>
{
   Widget build(BuildContext context){
     return Scaffold(appBar: AppBar(
        title: Text("Like Button Example"),
        leading: Icon(Icons.favorite,color:Colors.pinkAccent),
     ),
       body: Center(
         child: LikeButton(
           size:30.0,
           circleColor: CircleColor(start:Color(0xff00ddff),end:Color(0xff0099cc)),
           bubblesColor: BubblesColor(dotPrimaryColor: Color(0xff33b5e5),dotSecondaryColor: Color(0xff0099cc)),
           likeBuilder: (bool isLiked){
             // 这里对Icon进行设置
             return Icon(Icons.cloud,color:isLiked?Colors.deepPurpleAccent:Colors.grey,size:30.0);
           },
           likeCount:0,  // 初始化的点赞数量
           isLiked: false,  // 初始化的点赞效果
           // 这里text - 如果点赞数为0，显示的是“love” - 可以修改
           countBuilder: (int count,bool isLiked,String text){
             var color = isLiked ? Colors.deepPurpleAccent:Colors.grey;
             Widget result;
             if(count==0){ // 点赞数量为0时的提示语
               result = Text("like",style:TextStyle(color:color));
             }else{
               result = Text(text,style:TextStyle(color:color));
             }
             return result;
           },
           onTap: onLikeButtonTapped,
         )
       )
     );
   }
    // 触发事件
   Future<bool> onLikeButtonTapped(bool isLiked) async{
     return !isLiked;
   }


}