import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex_mobile/blocs/favorite_pokemons/favorite_pokemons.dart';
import 'package:pokedex_mobile/models/NamedAPIResource.dart';

class FavoritePokemonButton extends StatelessWidget {
  final NamedAPIResource currentPokemon;
  final FavoritePokemonsBloc favoritesPokemonsBloc;

  FavoritePokemonButton({
    @required this.favoritesPokemonsBloc,
    @required this.currentPokemon,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NamedAPIResource>>(
      stream: favoritesPokemonsBloc.favoritePokemonsStream,
      builder: (context, favoritesPokemonsSnapshot) {
        if (!favoritesPokemonsSnapshot.hasData) return SizedBox();

        var isFavoritePokemon = favoritesPokemonsSnapshot.data.firstWhere(
              (favorite) => favorite.url == currentPokemon.url,
              orElse: () => null,
            ) !=
            null;

        if (isFavoritePokemon) {
          return IconButton(
            icon: Icon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
            ),
            onPressed: () {
              favoritesPokemonsBloc.removeFromFavoritePokemons(currentPokemon);
            },
          );
        } else {
          return IconButton(
            icon: Icon(
              FontAwesomeIcons.heart,
            ),
            onPressed: () {
              favoritesPokemonsBloc.addToFavoritePokemons(currentPokemon);
            },
          );
        }
      },
    );
  }
}
