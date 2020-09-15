// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TypePokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypePokemon _$TypePokemonFromJson(Map<String, dynamic> json) {
  return TypePokemon(
    slot: json['slot'] as int,
    pokemon: json['pokemon'] == null
        ? null
        : NamedAPIResource.fromJson(json['pokemon'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TypePokemonToJson(TypePokemon instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('slot', instance.slot);
  writeNotNull('pokemon', instance.pokemon?.toJson());
  return val;
}
