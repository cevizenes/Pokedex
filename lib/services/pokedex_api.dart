import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokedexApi {
  static const String _baseUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> pokemonList = [];
    var result = await Dio().get(_baseUrl);
    var pokeList = jsonDecode(result.data)['pokemon'];
    if (pokeList is List) {
      pokemonList = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    }
    return pokemonList;
  }
}
