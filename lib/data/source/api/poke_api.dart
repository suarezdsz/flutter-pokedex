import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

//data / error
import 'package:pokedex/core/errors/exeptions.dart';
import 'package:pokedex/core/errors/app_exception.dart';

import 'package:pokedex/data/response/list_pokemons_response.dart';
import 'package:pokedex/data/response/detail_pokemon_response.dart';

class PokeApi {
  var client = http.Client();

  Future<ListPokemonsResponse> getPokemons(
      {required String limit, required String offset}) async {
    Uri url = Uri.https(
        'pokeapi.co', '/api/v2/pokemon', {'limit': limit, 'offset': offset});

    var responseJson = '';
    try {
      var response = await client.get(url);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    }
    return ListPokemonsResponse.fromJson(json.decode(responseJson));
  }

  Future<DetailsPokemonResponse> getPokemonDetails({required String ur}) async {
    Uri url = Uri.https('pokeapi.co', ur);

    var responseJson = '';
    try {
      var response = await client.get(url);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    }
    return DetailsPokemonResponse.fromJson(json.decode(responseJson));
  }
}
