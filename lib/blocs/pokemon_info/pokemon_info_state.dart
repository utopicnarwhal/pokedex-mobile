part of 'pokemon_info_bloc.dart';

@immutable
abstract class PokemonInfoState {
  final Pokemon pokemonInfo;

  PokemonInfoState({this.pokemonInfo});
}

class LoadingPokemonInfoState extends PokemonInfoState {
  LoadingPokemonInfoState({
    Pokemon pokemonInfo,
  }) : super(pokemonInfo: pokemonInfo);
}

class UnPokemonInfoState extends PokemonInfoState {}

class InPokemonInfoState extends PokemonInfoState {
  InPokemonInfoState({
    Pokemon pokemonInfo,
  }) : super(pokemonInfo: pokemonInfo);
}

class ErrorPokemonInfoState extends PokemonInfoState {
  final Exception exception;

  ErrorPokemonInfoState({
    Pokemon pokemonInfo,
    this.exception,
  }) : super(pokemonInfo: pokemonInfo);
}
