part of 'flying_pokemons_bloc.dart';

@immutable
abstract class FlyingPokemonsState {
  final List<NamedAPIResource> pokemonList;

  FlyingPokemonsState({this.pokemonList});
}

class LoadingFlyingPokemonsState extends FlyingPokemonsState {
  LoadingFlyingPokemonsState({
    List<NamedAPIResource> pokemonList,
  }) : super(pokemonList: pokemonList);
}

class UnFlyingPokemonsState extends FlyingPokemonsState {}

class InFlyingPokemonsState extends FlyingPokemonsState {
  InFlyingPokemonsState({
    List<NamedAPIResource> pokemonList,
  }) : super(pokemonList: pokemonList);
}

class ErrorFlyingPokemonsState extends FlyingPokemonsState {
  final Exception exception;

  ErrorFlyingPokemonsState({
    List<NamedAPIResource> pokemonList,
    this.exception,
  }) : super(pokemonList: pokemonList);
}
