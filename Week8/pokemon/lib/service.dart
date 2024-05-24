import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'model.dart';

part 'service.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2/")
abstract class PokemonInfo {
  factory PokemonInfo(Dio dio, {String baseUrl}) = _PokemonInfo;

  @GET('/pokemon/{name}/')
  Future<Pokemon> getPokemon(@Path("name") String name,);
}