part of 'pokedex_cubit.dart';

@immutable
abstract class PokedexState {}

class PokedexInitial extends PokedexState {}

class PokedexLoading extends PokedexState {}

class PokedexLoaded extends PokedexState {
  final List<Pokemon> pokemons;

  PokedexLoaded(this.pokemons);
}