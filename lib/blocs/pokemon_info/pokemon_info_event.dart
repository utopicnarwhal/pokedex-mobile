part of 'pokemon_info_bloc.dart';

@immutable
abstract class PokemonInfoEvent {
  Future<PokemonInfoState> applyAsync(
      {PokemonInfoState currentState, PokemonInfoBloc bloc});
}

class FetchPokemonInfoEvent extends PokemonInfoEvent {
  @override
  String toString() => 'FetchUserContactDataEvent';

  @override
  Future<PokemonInfoState> applyAsync(
      {PokemonInfoState currentState, PokemonInfoBloc bloc}) async {
    var pokemonInfo =
        await PokemonInfoRepository.getPokemonInfo(bloc.pokemonUrl);

    return InPokemonInfoState(
      pokemonInfo: pokemonInfo,
    );
  }
}
