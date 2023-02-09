import 'dart:async';

import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/services/api_service.dart';

class PokemonsBloc {
  StreamController<Pokemon?> _pokemonController = StreamController<Pokemon?>();

  StreamController<List<Pokemon>?> _pokemonsController =
      StreamController<List<Pokemon>?>();

  StreamController<String?> _pokemonNameController =
      StreamController<String?>();

  Stream<String?> get getPokemonName => _pokemonNameController.stream;

  Stream<List<Pokemon>?> get getPokemons => _pokemonsController.stream;

  void loadPokemos({required int limit}) async {
    List<Pokemon>? pokemons = await ApiService.getPokemons(limit: limit);
    _pokemonsController.add(pokemons);
    if (pokemons != null && pokemons.isNotEmpty) {
      setPokemon = pokemons[0];
    }
  }

  Stream<Pokemon?> get getPokemon => _pokemonController.stream;

  set setPokemon(Pokemon pokemon) {
    _pokemonNameController.add(pokemon.name);
    ApiService.getPokemon(pokemon).then((value) {
      _pokemonController.add(value);
    });
  }

  set updatePokemon(Pokemon pokemon) => _pokemonController.add(pokemon);

  PokemonsBloc() {
    ApiService.getPokemons(limit: 3).then((value) {
      _pokemonsController.add(value);
      if (value != null && value.isNotEmpty) {
        setPokemon = value[0];
      }
    });
  }

  disponse() {
    _pokemonsController.close();
    _pokemonController.close();
    _pokemonNameController.close();
  }
}
