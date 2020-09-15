// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeAPIType _$PokeAPITypeFromJson(Map<String, dynamic> json) {
  return PokeAPIType(
    id: json['id'] as int,
    name: json['name'] as String,
    pokemon: (json['pokemon'] as List)
        ?.map((e) =>
            e == null ? null : TypePokemon.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    generation: json['generation'] == null
        ? null
        : NamedAPIResource.fromJson(json['generation'] as Map<String, dynamic>),
    moveDamageClass: json['move_damage_class'] == null
        ? null
        : NamedAPIResource.fromJson(
            json['move_damage_class'] as Map<String, dynamic>),
    moves: (json['moves'] as List)
        ?.map((e) => e == null
            ? null
            : NamedAPIResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokeAPITypeToJson(PokeAPIType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('pokemon', instance.pokemon?.map((e) => e?.toJson())?.toList());
  writeNotNull('generation', instance.generation?.toJson());
  writeNotNull('move_damage_class', instance.moveDamageClass?.toJson());
  writeNotNull('moves', instance.moves?.map((e) => e?.toJson())?.toList());
  return val;
}
