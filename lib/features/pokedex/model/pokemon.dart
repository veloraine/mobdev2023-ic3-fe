import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required String name,
    required String type,
    required int height,
    required int weight,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, Object?> json)
  => _$PokemonFromJson(json);
}