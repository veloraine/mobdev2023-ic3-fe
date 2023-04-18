import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:internal_class3/features/pokedex/data/datasource/remote_datasource.dart';

import '../../data/repository/pokedex_repository.dart';
import '../../model/pokemon.dart';

part 'pokedex_state.dart';

class PokedexCubit extends Cubit<PokedexState> {
  final PokedexRepository repository = PokedexRepositoryImpl(PokemonRemoteDataSource());

  PokedexCubit() : super(PokedexInitial());

  void getPokemons() async {
    emit(PokedexLoading());
    final pokemons = await repository.getPokemons();
    emit(PokedexLoaded(pokemons));
  }

  void createPokemon(String name, String type, int weight, int height) async {
    emit(PokedexLoading());
    await repository.createPokemon(name, type, weight, height);
    final pokemons = await repository.getPokemons();
    emit(PokedexLoaded(pokemons));
  }
}



