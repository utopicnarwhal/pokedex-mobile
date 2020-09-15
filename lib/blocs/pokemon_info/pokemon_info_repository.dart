part of 'pokemon_info_bloc.dart';

class PokemonInfoRepository {
  static Future<Pokemon> getPokemonInfo(String pokemonUrl) async {
    var response = await ApiHttpClient().getUri(
      pokemonUrl.replaceFirst(kPokeAPIUrl, ''),
    );
    if (response?.data == null) return null;

    return Pokemon.fromJson(response.data);
  }
}
