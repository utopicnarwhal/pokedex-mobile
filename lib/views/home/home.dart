import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex_mobile/blocs/flying_pokemons/flying_pokemons_bloc.dart';
import 'package:pokedex_mobile/components/app_bar.dart';
import 'package:pokedex_mobile/components/error_block.dart';
import 'package:pokedex_mobile/components/shimmers.dart';
import 'package:pokedex_mobile/constants.dart';
import 'package:pokedex_mobile/views/favorites/favorites.dart';
import 'package:pokedex_mobile/views/home/components/change_theme_button.dart';
import 'package:pokedex_mobile/views/pokemon_info/pokemon_info.dart';
import 'package:utopic_toast/utopic_toast.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/Home';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FlyingPokemonsBloc _flyingPokemonsBloc;

  @override
  void initState() {
    super.initState();
    _flyingPokemonsBloc = FlyingPokemonsBloc()..fetchFlyingPokemons();
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
              'Flying Pokemons',
              style: Theme.of(context).textTheme.headline6,
            ),
            ChangeThemeButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.solidHeart),
        onPressed: () {
          Navigator.of(context).pushNamed(FavoritesPokemons.routeName);
        },
      ),
      body: SafeArea(
        bottom: false,
        child: Scrollbar(
          child: RefreshIndicator(
            child: BlocConsumer<FlyingPokemonsBloc, FlyingPokemonsState>(
              cubit: _flyingPokemonsBloc,
              listener: (context, state) {
                if (!(state is ErrorFlyingPokemonsState)) return;

                ToastManager().showToast(
                  (state as ErrorFlyingPokemonsState).exception.toString(),
                  type: ToastType.error,
                );
              },
              builder: (context, state) {
                if (state is UnFlyingPokemonsState) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'There is no data yet',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                } else if (state is LoadingFlyingPokemonsState) {
                  return ShimmerListView(
                    itemCount:
                        (MediaQuery.of(context).size.height / 84).round(),
                  );
                } else if (state is ErrorFlyingPokemonsState) {
                  return ErrorBlock(
                    errorMessage: state.exception?.toString(),
                  );
                } else if (state is InFlyingPokemonsState) {
                  return ListView.separated(
                    physics: kBouncingAlwaysScrollableScrollPhysics,
                    itemCount: state.pokemonList.length,
                    separatorBuilder: (context, index) {
                      return Divider(indent: 16);
                    },
                    itemBuilder: (context, index) {
                      var hasUrl = state.pokemonList[index].url != null;

                      return ListTile(
                        title: Text(state.pokemonList[index].name),
                        subtitle: Text(
                          state.pokemonList[index].url
                              ?.replaceFirst(kPokeAPIUrl, ''),
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
                                  arguments: state.pokemonList[index],
                                );
                              }
                            : null,
                      );
                    },
                  );
                }
                return SizedBox();
              },
            ),
            onRefresh: () async {
              _flyingPokemonsBloc.fetchFlyingPokemons();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _flyingPokemonsBloc?.close();
    super.dispose();
  }
}
