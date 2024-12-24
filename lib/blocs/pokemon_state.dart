part of 'pokemon_cubit.dart';

@immutable
sealed class PokemonState {}

final class PokemonInitial extends PokemonState {}
final class PokemonsDataLoading extends PokemonState {}
final class PokemonsDataSuccess extends PokemonState {}
final class PokemonsDataError extends PokemonState {
  final String error;
  PokemonsDataError(this.error);
}