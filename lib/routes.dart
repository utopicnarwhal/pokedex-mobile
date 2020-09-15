import 'package:flutter/material.dart';
import 'package:pokedex_mobile/models/NamedAPIResource.dart';
import 'package:pokedex_mobile/views/favorites/favorites.dart';
import 'package:pokedex_mobile/views/home/home.dart';
import 'package:pokedex_mobile/views/pokemon_info/pokemon_info.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      switch (settings.name) {
        case HomeView.routeName:
          return HomeView();
        case PokemonInfo.routeName:
          if (!(settings.arguments is NamedAPIResource)) {
            print('passed data is not correct');
            break;
          }
          return PokemonInfo(pokemonRef: settings.arguments);
        case FavoritesPokemons.routeName:
          return FavoritesPokemons();
        default:
          print('undefined route');
      }
      return HomeView();
    },
  );
}
