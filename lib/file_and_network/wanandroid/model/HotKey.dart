import 'package:json_annotation/json_annotation.dart';

part 'HotKey.g.dart';

@JsonSerializable()
class HotKey{
  int id;
  String link;
  String name;
  int order;
  int visible;

  HotKey(this.id, this.link, this.name, this.order, this.visible);


}