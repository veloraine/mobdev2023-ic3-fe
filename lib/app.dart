import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/pokedex/view/cubit/pokedex_cubit.dart';
import 'features/pokedex/view/pages/pokedex_page.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokedexCubit()..getPokemons(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: PokedexPage()),
    );
  }
}
