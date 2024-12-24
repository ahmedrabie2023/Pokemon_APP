import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/blocs/pokemon_cubit.dart';

import '../views/pokemon_home_page.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokemonCubit()..getAllPokemonsData(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PokemonHomePage(),
      ),
    );
  }
}
