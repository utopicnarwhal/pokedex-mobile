// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NamedAPIResource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamedAPIResource _$NamedAPIResourceFromJson(Map<String, dynamic> json) {
  return NamedAPIResource(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$NamedAPIResourceToJson(NamedAPIResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('url', instance.url);
  return val;
}
