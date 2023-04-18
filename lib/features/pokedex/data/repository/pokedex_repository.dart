import '../../model/pokemon.dart';
import '../datasource/remote_datasource.dart';

abstract class PokedexRepository {
  Future<List<Pokemon>> getPokemons();
  Future<void> createPokemon(String name, String type, int weight, int height);
}

class PokedexRepositoryImpl implements PokedexRepository {
  final PokemonDataSource dataSource;

  PokedexRepositoryImpl(this.dataSource);

  @override
  Future<List<Pokemon>> getPokemons() async {
    return await dataSource.getPokemons();
  }

  @override
  Future<void> createPokemon(String name, String type, int weight, int height) {
    return dataSource.createPokemon(name, type, weight, height);
  }
}
