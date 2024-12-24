import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/blocs/pokemon_cubit.dart';
import 'package:pokemon_app/components/card_item.dart';

class PokemonHomePage extends StatelessWidget {
  const PokemonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Pokemon's",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        drawer: const Drawer(),
        body: BlocConsumer<PokemonCubit,PokemonState>(
          listener: (BuildContext context, Object? state) {  },
          builder: (BuildContext context, state) {
            var cubit = PokemonCubit.get(context);
           if(state is PokemonsDataLoading){
             return const Center(
               child: CircularProgressIndicator()
                            );
           }
           else if(state is PokemonsDataSuccess){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: GridView.builder(
                 itemCount: cubit.pokemonModel?.pokemon?.length,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
                 itemBuilder: (context, index) =>
                  CardItem(image:'${
                  cubit.pokemonModel!.pokemon![index].img
                  }',
                      text: '${
                          cubit.pokemonModel!.pokemon![index].name
                      }'),
               ),
             );
           }
           else if (state is PokemonsDataError){
             return Text(state.error);
           }
           return const SizedBox.shrink();
          },

        ));
  }
}
