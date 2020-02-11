import 'package:message_reminder/model.dart';

Message m1 = new Message(
  his_nickname: "胖虎虎",
  his_mobile: "19851842802",
  his_profile: "images/1.jpg",
  
  type: 1,
  memo_id: "",
  memo_title: "",
  time: DateTime.parse("2019-02-03 20:43:33"),
);

Message m2 = new Message(
  his_nickname: "意欢",
  his_mobile: "17777777777",
  his_profile: "images/5.jpg",

  type:2,
  memo_id:"1777777777-2-909",
  memo_title: "看海-所有的日子/都是海上的日子",
  time: DateTime.parse("2020-03-16 18:20:22"),
);

Message m3 = new Message(
  his_nickname: "Shirley",
  his_mobile: "188888888888",
  his_profile: "images/2.jpg",

  type:1,
  memo_id:"",
  memo_title: "",
  time: DateTime.parse("2016-03-16 18:20:22"),
);

Message m4 = new Message(
  his_nickname: "青樱",
  his_mobile: "150000000000",
  his_profile: "images/8.jpg",

  type:2,
  memo_id:"15000000000-2-909",
  memo_title: "漫步故宫-红墙绿瓦",
  time: DateTime.parse("2020-01-16 18:20:22"),
);


List<Message> messages = [m1,m2,m3,m4];