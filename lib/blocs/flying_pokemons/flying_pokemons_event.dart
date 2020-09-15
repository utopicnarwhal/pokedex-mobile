part of 'flying_pokemons_bloc.dart';

@immutable
abstract class FlyingPokemonsEvent {
  Future<FlyingPokemonsState> applyAsync(
      {FlyingPokemonsState currentState, FlyingPokemonsBloc bloc});
}

class FetchFlyingPokemonsEvent extends FlyingPokemonsEvent {
  @override
  String toString() => 'FetchUserContactDataEvent';

  @override
  Future<FlyingPokemonsState> applyAsync(
      {FlyingPokemonsState currentState, FlyingPokemonsBloc bloc}) async {
    var flyingPokemons = await FlyingPokemonsRepository.getFlyingPokemons();

    return InFlyingPokemonsState(
      pokemonList: flyingPokemons,
    );
  }
}
