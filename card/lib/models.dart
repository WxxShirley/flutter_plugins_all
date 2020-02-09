import 'package:latlong/latlong.dart';

class Memo_Show{
  final DateTime time;
  final LatLng latlong;
  int likes;
  final String location;
  final String loc_title;
  final String description;
  final String memo_title;

  final String user_mobile;
  final String nickname;
  final int img;

  Memo_Show({this.time,this.latlong,this.likes,this.location,this.loc_title,this.description,this.user_mobile,this.memo_title,this.nickname,this.img});

  factory Memo_Show.fromJson(Map<String,dynamic> json)
  {
    return Memo_Show(
      time: json["time"],
      latlong: LatLng(json["lat"],json["long"]),
      likes: json["likes"],
      location: json["location"],
      loc_title: json["title"],
      description: json["description"],
      memo_title: json["memo_title"],
      user_mobile: json["user_mobile"],
      nickname: json["nickname"],
    );
  }
}

