import 'package:azlistview/azlistview.dart';

class Friend extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;

  Friend({
    this.name,
    this.tagIndex,
    this.namePinyin,
  });

  @override
  String getSuspensionTag() => tagIndex;

 
}
