import 'package:json_annotation/json_annotation.dart';

part 'HomeBanner.g.dart';

@JsonSerializable()
class HomeBanner {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  HomeBanner(this.desc, this.id, this.imagePath, this.isVisible, this.order,
      this.title, this.type, this.url);

  factory HomeBanner.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);
}
