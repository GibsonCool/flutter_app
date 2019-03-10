// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HotKey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotKey _$HotKeyFromJson(Map<String, dynamic> json) {
  return HotKey(json['id'] as int, json['link'] as String,
      json['name'] as String, json['order'] as int, json['visible'] as int);
}

Map<String, dynamic> _$HotKeyToJson(HotKey instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible
    };
