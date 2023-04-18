import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internal_class3/core/constants/basecolors.dart';

import '../cubit/pokedex_cubit.dart';
import '../widgets/pokemon_items.dart';
import 'add_pokemon_page.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.primaryBlack,
        appBar: AppBar(
          title: const Text(
            'Pokedex',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: BaseColors.darkGrey,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.read<PokedexCubit>().getPokemons();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: BlocBuilder<PokedexCubit, PokedexState>(
          builder: (context, state) {
            if (state is PokedexLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PokedexLoaded) {
              return ListView.builder(
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  return PokemonItems(
                    name: state.pokemons[index].name,
                    type: state.pokemons[index].type,
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'Something went wrong',
                  style: TextStyle(color: BaseColors.white),
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: BaseColors.darkGrey,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePokemonPage(
                  onCreate: (String name, String type, int weight, int height) {
                    context.read<PokedexCubit>().createPokemon(
                          name,
                          type,
                          weight,
                          height,
                        );
                  },
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
