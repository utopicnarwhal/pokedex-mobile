import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_mobile/models/NamedAPIResource.dart';

part 'TypePokemon.g.dart';

@JsonSerializable()
class TypePokemon {
  int slot;
  NamedAPIResource pokemon;

  TypePokemon({
    this.slot,
    this.pokemon,
  });

  factory TypePokemon.fromJson(Map<String, dynamic> json) =>
      _$TypePokemonFromJson(json);
  Map<String, dynamic> toJson() => _$TypePokemonToJson(this);
}
