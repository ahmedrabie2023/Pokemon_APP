import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/services/dio_helper.dart';
import 'package:pokemon_app/services/end_point.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());
  static PokemonCubit get(context)=>BlocProvider.of(context);
  PokemonModel? pokemonModel;
  void getAllPokemonsData()
  {
    DioHelper.getData(url: GET_ALL_POKEMONS).then((value){
      emit(PokemonsDataLoading());
      var jsonData = jsonDecode(value.data);
      pokemonModel =PokemonModel.fromJson(jsonData);
      emit(PokemonsDataSuccess());
    }).catchError((onError){
      if (kDebugMode) {
        print(onError);
        emit(PokemonsDataError(onError.toString()));
      }
    });
  }

}
