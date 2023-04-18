import 'dart:convert';

import 'package:internal_class3/core/constants/endpoints.dart';

import '../../../../core/constants/http_helper.dart';
import '../../model/pokemon.dart';

abstract class PokemonDataSource {
  Future<List<Pokemon>> getPokemons();

  Future<void> createPokemon(String name, String type, int weight, int height);
}

class PokemonRemoteDataSource implements PokemonDataSource {
  @override
  Future<List<Pokemon>> getPokemons() async {
    const url = Endpoints.pokemonList;
    final params = <String, dynamic>{};
    final response = await getIt(url, params);
    if (response.statusCode == 200) {
      final pokemons = <Pokemon>[];
      final json = jsonDecode(response.body);
      for (final pokemon in json['data']) {
        pokemons.add(Pokemon.fromJson(pokemon));
      }
      return pokemons;
    } else {
      throw Exception('Failed to load pokemons');
    }
  }

  @override
  Future<void> createPokemon(String name, String type, int weight, int height) {
    const url = Endpoints.pokemonCreate;
    final body = <String, dynamic>{
      'name': name,
      'type': type,
      'weight': weight,
      'height': height,
    };
    return postIt(url, body);
  }
}
