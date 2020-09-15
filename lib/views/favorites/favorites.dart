import 'package:flutter/material.dart';
import 'package:pokedex_mobile/blocs/favorite_pokemons/favorite_pokemons.dart';
import 'package:pokedex_mobile/components/app_bar.dart';
import 'package:pokedex_mobile/constants.dart';
import 'package:pokedex_mobile/models/NamedAPIResource.dart';
import 'package:pokedex_mobile/views/pokemon_info/pokemon_info.dart';

class FavoritesPokemons extends StatefulWidget {
  static const routeName = '/Favorites';

  @override
  _FavoritesPokemonsState createState() => _FavoritesPokemonsState();
}

class _FavoritesPokemonsState extends State<FavoritesPokemons> {
  FavoritePokemonsBloc _favoritePokemonsBloc;

  @override
  void initState() {
    super.initState();
    _favoritePokemonsBloc = FavoritePokemonsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: PokedexAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Favorites',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Scrollbar(
          child: RefreshIndicator(
            onRefresh: () async {
              return _favoritePokemonsBloc.refreshFavoritePokemons();
            },
            child: StreamBuilder<List<NamedAPIResource>>(
              stream: _favoritePokemonsBloc.favoritePokemonsStream,
              builder: (context, favoritesPokemonsSnapshot) {
                if (!favoritesPokemonsSnapshot.hasData) return SizedBox();

                return ListView.separated(
                  physics: kBouncingAlwaysScrollableScrollPhysics,
                  itemBuilder: (context, index) {
                    var currentIndexData =
                        favoritesPokemonsSnapshot.data[index];

                    var hasUrl = currentIndexData.url != null;

                    return ListTile(
                      title: Text(currentIndexData.name),
                      subtitle: Text(
                        currentIndexData.url?.replaceFirst(kPokeAPIUrl, ''),
                      ),
                      trailing: hasUrl
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                kIconArrowForward,
                              ],
                            )
                          : null,
                      onTap: hasUrl
                          ? () {
                              Navigator.of(context).pushNamed(
                                PokemonInfo.routeName,
                                arguments: currentIndexData,
                              );
                            }
                          : null,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(indent: 16);
                  },
                  itemCount: favoritesPokemonsSnapshot.data.length,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _favoritePokemonsBloc?.dispose();
    super.dispose();
  }
}
