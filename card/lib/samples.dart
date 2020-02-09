import 'package:card/models.dart';
import 'package:latlong/latlong.dart';

Memo_Show memo1 = new Memo_Show(
   time:DateTime.now(),
   latlong: LatLng(31.17,121.30),
   likes: 5,
   location: "上海市 邯郸路220号",
   loc_title: "复旦大学(邯郸校区)",
   description: "想喝喜茶Coco吃海底捞烤肉汉堡肯德基麦当劳还有好好学习。",
   memo_title: "想回学校",
   user_mobile: "18933928018",
   nickname: "爱大笑的CC",
   img:1,
);

Memo_Show memo2 = new Memo_Show(
  time: DateTime.parse("2020-02-04 20:18:04Z"),
  likes: 1,
  latlong: LatLng(39.54,116.23),
  location: "北京市 东城区景山街4号",
  loc_title: "故宫",
  description: "墙头马上遥相顾，一见知君即断肠。",
  memo_title: "城楼情起",
  user_mobile: "15333333333",
  nickname: "青樱",
  img:2,
);

List<Memo_Show> memos = [memo1,memo2];

List imgs = [
  "images/1.jpg",
  "images/2.jpg",
  "images/3.jpg",
];