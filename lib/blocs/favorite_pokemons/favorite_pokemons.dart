import 'package:pokedex_mobile/models/NamedAPIResource.dart';
import 'package:pokedex_mobile/services/local_storage.dart';
import 'package:rxdart/rxdart.dart';

class FavoritePokemonsBloc {
  var _favoritePokemonsController =
      BehaviorSubject<List<NamedAPIResource>>.seeded([]);
  //output
  Stream<List<NamedAPIResource>> get favoritePokemonsStream =>
      _favoritePokemonsController.stream;
  //input
  Sink<List<NamedAPIResource>> get _favoritePokemonsSink =>
      _favoritePokemonsController.sink;

  FavoritePokemonsBloc() {
    LocalStorage().getFavoritePokemons().then((favoritesFromStorage) =>
        _favoritePokemonsController.add(favoritesFromStorage));
  }

  Future<void> refreshFavoritePokemons() async {
    var favoritesFromStorage = await LocalStorage().getFavoritePokemons();
    _favoritePokemonsController.add(favoritesFromStorage);
  }

  List<NamedAPIResource> getFavoritePokemons() {
    return _favoritePokemonsController.value;
  }

  void addToFavoritePokemons(NamedAPIResource pokemonRef) {
    _favoritePokemonsSink
        .add(_favoritePokemonsController.value..add(pokemonRef));
    LocalStorage().addFavoritePokemon(pokemonRef);
  }

  void removeFromFavoritePokemons(NamedAPIResource pokemonRef) {
    _favoritePokemonsSink.add(_favoritePokemonsController.value
      ..removeWhere((element) => element.url == pokemonRef.url));
    LocalStorage().deleteFavoritePokemon(pokemonRef.url);
  }

  void dispose() {
    _favoritePokemonsController.close();
  }
}
