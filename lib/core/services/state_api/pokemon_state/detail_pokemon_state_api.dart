import 'package:flutter/material.dart';

import 'package:pokedex/data/response/detail_pokemon_response.dart';
import 'package:pokedex/core/errors/app_exception.dart';
import 'package:pokedex/data/source/api/poke_api.dart';

enum PokemonState { initial, loading, loaded, empty, error }

class PokemonDetailsChangeNotifier with ChangeNotifier {
  final String ur;
  late DetailsPokemonResponse items;
  final pokeApi = PokeApi();

  PokemonState prokemonState = PokemonState.initial;

  late DetailsPokemonResponse listProkemonResponse;
  late AppException appException;

  PokemonDetailsChangeNotifier(this.ur) {
    getDetailsPokemon(code: 200, ur: ur);
  }

  getDetailsPokemon({int code = 200, String ur = ''}) async {
    setState(PokemonState.loading);
    try {
      listProkemonResponse =
          await pokeApi.getPokemonDetails(ur: '/api/v2/pokemon/1/');

      setState(PokemonState.loaded);
    } on AppException catch (appException) {
      setFailure(appException);
    }
    notifyListeners();
  }

  DetailsPokemonResponse get pokemons => listProkemonResponse;

  PokemonState get state => prokemonState;

  setState(PokemonState value) {
    prokemonState = value;
    notifyListeners();
  }

  AppException get failure => appException;
  setFailure(AppException value) {
    appException = value;
    setState(PokemonState.error);
  }

  Future delay() {
    return Future.delayed(const Duration(seconds: 2));
  }
}
