import 'package:json_annotation/json_annotation.dart';

part 'NamedAPIResource.g.dart';

@JsonSerializable()
class NamedAPIResource {
  String name;
  String url;

  NamedAPIResource({
    this.name,
    this.url,
  });

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) =>
      _$NamedAPIResourceFromJson(json);
  Map<String, dynamic> toJson() => _$NamedAPIResourceToJson(this);
}
