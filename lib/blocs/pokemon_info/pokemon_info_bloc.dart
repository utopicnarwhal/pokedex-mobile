import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex_mobile/constants.dart';
import 'package:pokedex_mobile/models/Pokemon.dart';
import 'package:pokedex_mobile/services/api_http_client.dart';

part 'pokemon_info_event.dart';
part 'pokemon_info_state.dart';
part 'pokemon_info_repository.dart';

class PokemonInfoBloc extends Bloc<PokemonInfoEvent, PokemonInfoState> {
  final String pokemonUrl;

  PokemonInfoBloc(this.pokemonUrl) : super(UnPokemonInfoState());

  void fetchPokemonInfo() {
    if (state is LoadingPokemonInfoState) {
      return;
    }
    this.add(FetchPokemonInfoEvent());
  }

  @override
  Stream<PokemonInfoState> mapEventToState(
    PokemonInfoEvent event,
  ) async* {
    yield LoadingPokemonInfoState(pokemonInfo: this.state.pokemonInfo);
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (e) {
      print(e);
      yield ErrorPokemonInfoState(
        pokemonInfo: this.state.pokemonInfo,
        exception: e is Exception ? e : Exception(e.toString()),
      );
    }
  }
}
