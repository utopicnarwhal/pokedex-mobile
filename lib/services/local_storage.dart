import 'dart:async';
import 'dart:convert';

import 'package:pokedex_mobile/models/NamedAPIResource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<NamedAPIResource>> getFavoritePokemons() async {
    var prefs = await _prefs;
    try {
      var result = List<NamedAPIResource>();

      var favoritePokemonsJson = prefs.getStringList('FavoritePokemons');
      if (favoritePokemonsJson?.isNotEmpty != true) {
        return result;
      }

      favoritePokemonsJson.forEach((element) {
        result.add(NamedAPIResource.fromJson(json.decode(element)));
      });
      return result;
    } catch (e) {
      await prefs.setStringList('FavoritePokemons', List<String>());
      return List<NamedAPIResource>();
    }
  }

  Future<bool> setFavoritePokemons(List<NamedAPIResource> pokemons) async {
    if (pokemons == null) return true;

    var prefs = await _prefs;
    try {
      var favoritesPokemonsJsonStrings = List<String>();
      pokemons.forEach((element) {
        favoritesPokemonsJsonStrings.add(json.encode(element.toJson()));
      });
      return await prefs.setStringList(
        'FavoritePokemons',
        favoritesPokemonsJsonStrings,
      );
    } catch (e) {
      return await prefs.setStringList('FavoritePokemons', List<String>());
    }
  }

  Future<bool> isFavoritePokemon(String pokemonUrl) async {
    var prefs = await _prefs;
    try {
      var favoritePokemonIds = prefs.getStringList('FavoritePokemons');
      if (favoritePokemonIds?.isNotEmpty != true) {
        return false;
      }

      return favoritePokemonIds.any((element) {
        return NamedAPIResource.fromJson(json.decode(element)).url ==
            pokemonUrl;
      });
    } catch (e) {
      await prefs.setStringList('FavoritePokemons', List<String>());
      return false;
    }
  }

  Future<bool> addFavoritePokemon(NamedAPIResource pokemon) async {
    var favoritePokemons = await getFavoritePokemons();
    if (favoritePokemons.any((element) => element.url == pokemon.url))
      return true;

    favoritePokemons.add(pokemon);
    return await setFavoritePokemons(favoritePokemons);
  }

  Future<bool> deleteFavoritePokemon(String pokemonUrl) async {
    var favoritePokemons = await getFavoritePokemons();
    if (!favoritePokemons.any((element) => element.url == pokemonUrl))
      return true;

    favoritePokemons.removeWhere((element) => element.url == pokemonUrl);
    return await setFavoritePokemons(favoritePokemons);
  }
}
