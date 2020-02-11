class Message{
  final String his_nickname;
  final String his_mobile;
  final String his_profile;
  final int type;
  
  // type == 1 : another user following you
  // type == 2 : another user "likes" your memo
  
  final String memo_id;
  final String memo_title;
  final DateTime time;

  Message({this.his_nickname,this.his_mobile,this.his_profile,this.type,this.memo_id,this.memo_title,this.time});
}

