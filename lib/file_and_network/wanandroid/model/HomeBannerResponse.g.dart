// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeBannerResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerResponse _$HomeBannerResponseFromJson(Map<String, dynamic> json) {
  return HomeBannerResponse(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : HomeBanner.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$HomeBannerResponseToJson(HomeBannerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
