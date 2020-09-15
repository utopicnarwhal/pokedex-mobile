// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    id: json['id'] as int,
    name: json['name'] as String,
    baseExperience: json['base_experience'] as int,
    height: json['height'] as int,
    isDefault: json['is_default'] as bool,
    order: json['order'] as int,
    weight: json['weight'] as int,
    locationAreaEncounters: json['location_area_encounters'] as String,
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('base_experience', instance.baseExperience);
  writeNotNull('height', instance.height);
  writeNotNull('is_default', instance.isDefault);
  writeNotNull('order', instance.order);
  writeNotNull('weight', instance.weight);
  writeNotNull('location_area_encounters', instance.locationAreaEncounters);
  return val;
}
