import 'package:json_annotation/json_annotation.dart';

part 'Pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  int id;
  String name;
  int baseExperience;
  int height;
  bool isDefault;
  int order;
  int weight;
  String locationAreaEncounters;

  Pokemon({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.locationAreaEncounters,
  }) : assert(id != null);

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
