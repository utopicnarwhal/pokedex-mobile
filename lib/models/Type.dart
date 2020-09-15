import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_mobile/models/NamedAPIResource.dart';
import 'package:pokedex_mobile/models/TypePokemon.dart';

part 'Type.g.dart';

@JsonSerializable()
class PokeAPIType {
  int id;
  String name;
  List<TypePokemon> pokemon;
  NamedAPIResource generation;
  NamedAPIResource moveDamageClass;
  List<NamedAPIResource> moves;

  PokeAPIType({
    this.id,
    this.name,
    this.pokemon,
    this.generation,
    this.moveDamageClass,
    this.moves,
  }) : assert(id != null);

  factory PokeAPIType.fromJson(Map<String, dynamic> json) => _$PokeAPITypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokeAPITypeToJson(this);
}
