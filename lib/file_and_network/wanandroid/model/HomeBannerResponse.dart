import 'package:flutter_app/file_and_network/wanandroid/BaseModel.dart';
import 'package:flutter_app/file_and_network/wanandroid/model/HomeBanner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'HomeBannerResponse.g.dart';

@JsonSerializable()
class HomeBannerResponse extends BaseResponse<List<HomeBanner>> {
  HomeBannerResponse(List<HomeBanner> data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory HomeBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerResponseToJson(this);
}
