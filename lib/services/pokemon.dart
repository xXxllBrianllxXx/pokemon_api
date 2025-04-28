import 'package:dio/dio.dart';

// Models
import 'package:poke_api/models/pokemon.dart';

class ApiService {

  final String baseUrl = 'https://pokeapi.co/api/v2';

  Future<List<dynamic>> getPokemonList() async {
    final response = await Dio().get('$baseUrl/pokemon?limit=200');

    if(response.statusCode == 200) {
      final data = response.data;
      return data['results'];
    } else {
      return [];
    }
  }

  Future<Pokemon?> getPokemonDetail(pokemonId) async {
    final response = await Dio().get('$baseUrl/pokemon/$pokemonId');

    if(response.statusCode == 200) {
      return Pokemon.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<Pokemon?> getPokemonDetailByUrl(url) async {
    final response = await Dio().get(url);

    if(response.statusCode == 200) {
      return Pokemon.fromJson(response.data);
    } else {
      return null;
    }
  }
}