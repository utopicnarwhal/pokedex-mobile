import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex_mobile/models/NamedAPIResource.dart';
import 'package:pokedex_mobile/models/Type.dart';
import 'package:pokedex_mobile/services/api_http_client.dart';

part 'flying_pokemons_event.dart';
part 'flying_pokemons_state.dart';
part 'flying_pokemons_repository.dart';

class FlyingPokemonsBloc
    extends Bloc<FlyingPokemonsEvent, FlyingPokemonsState> {
  FlyingPokemonsBloc() : super(UnFlyingPokemonsState());

  void fetchFlyingPokemons() {
    if (state is LoadingFlyingPokemonsState) {
      return;
    }
    this.add(FetchFlyingPokemonsEvent());
  }

  @override
  Stream<FlyingPokemonsState> mapEventToState(
    FlyingPokemonsEvent event,
  ) async* {
    yield LoadingFlyingPokemonsState(pokemonList: this.state.pokemonList);
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (e) {
      print(e);
      yield ErrorFlyingPokemonsState(
        pokemonList: this.state.pokemonList,
        exception: e is Exception ? e : Exception(e.toString()),
      );
    }
  }
}
