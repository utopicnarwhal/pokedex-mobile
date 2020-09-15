part of 'flying_pokemons_bloc.dart';

class FlyingPokemonsRepository {
  static Future<List<NamedAPIResource>> getFlyingPokemons() async {
    var response = await ApiHttpClient().getUri(
      'type/3/',
    );
    if (response?.data == null) return null;

    var type = PokeAPIType.fromJson(response.data);
    var typePokemonList = type?.pokemon;

    return typePokemonList
        ?.map((typePokemon) => typePokemon?.pokemon)
        ?.toList();
  }
}
