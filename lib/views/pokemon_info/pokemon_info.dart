import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_mobile/blocs/favorite_pokemons/favorite_pokemons.dart';
import 'package:pokedex_mobile/blocs/pokemon_info/pokemon_info_bloc.dart';
import 'package:pokedex_mobile/components/app_bar.dart';
import 'package:pokedex_mobile/components/error_block.dart';
import 'package:pokedex_mobile/components/favorite_pokemon_button.dart';
import 'package:pokedex_mobile/components/shimmers.dart';
import 'package:pokedex_mobile/constants.dart';
import 'package:pokedex_mobile/models/NamedAPIResource.dart';
import 'package:utopic_toast/utopic_toast.dart';

class PokemonInfo extends StatefulWidget {
  static const routeName = '/PokemonInfo';

  final NamedAPIResource pokemonRef;

  PokemonInfo({
    @required this.pokemonRef,
  });

  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  PokemonInfoBloc _pokemonInfoBloc;
  FavoritePokemonsBloc _favoritePokemonsBloc;

  @override
  void initState() {
    super.initState();
    _pokemonInfoBloc = PokemonInfoBloc(widget.pokemonRef.url)
      ..fetchPokemonInfo();
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
              widget.pokemonRef.name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        actions: [
          FavoritePokemonButton(
            favoritesPokemonsBloc: _favoritePokemonsBloc,
            currentPokemon: widget.pokemonRef,
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Scrollbar(
          child: RefreshIndicator(
            child: BlocConsumer<PokemonInfoBloc, PokemonInfoState>(
              cubit: _pokemonInfoBloc,
              listener: (context, state) {
                if (!(state is ErrorPokemonInfoState)) return;

                ToastManager().showToast(
                  (state as ErrorPokemonInfoState).exception.toString(),
                  type: ToastType.error,
                );
              },
              builder: (context, state) {
                if (state is UnPokemonInfoState) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'There is no data yet',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                } else if (state is LoadingPokemonInfoState) {
                  return ShimmerListView(
                    itemCount:
                        (MediaQuery.of(context).size.height / 84).round(),
                  );
                } else if (state is ErrorPokemonInfoState) {
                  return ErrorBlock(
                    errorMessage: state.exception?.toString(),
                    onTryAgain: () {
                      _pokemonInfoBloc.fetchPokemonInfo();
                    },
                  );
                } else if (state is InPokemonInfoState) {
                  List<Widget> pockemonInfoTiles = [
                    ListTile(
                      title: Text(state.pokemonInfo.name),
                      subtitle: Text('Name'),
                    ),
                    ListTile(
                      title: Text(state.pokemonInfo.height.toString()),
                      subtitle: Text('Height'),
                    ),
                    ListTile(
                      title: Text(state.pokemonInfo.weight.toString()),
                      subtitle: Text('Weight'),
                    ),
                    ListTile(
                      title: Text(state.pokemonInfo.baseExperience.toString()),
                      subtitle: Text('Base Experience'),
                    ),
                  ];
                  return ListView.separated(
                    physics: kBouncingAlwaysScrollableScrollPhysics,
                    itemCount: pockemonInfoTiles.length,
                    separatorBuilder: (context, index) {
                      return Divider(indent: 16);
                    },
                    itemBuilder: (context, index) {
                      return pockemonInfoTiles[index];
                    },
                  );
                }
                return SizedBox();
              },
            ),
            onRefresh: () async {
              _pokemonInfoBloc.fetchPokemonInfo();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pokemonInfoBloc?.close();
    _favoritePokemonsBloc?.dispose();
    super.dispose();
  }
}
