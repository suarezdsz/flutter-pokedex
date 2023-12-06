import 'package:flutter/material.dart';
import 'package:pokedex/data/response/list_pokemons_response.dart';
import 'package:pokedex/core/errors/app_exception.dart';
import 'package:pokedex/data/source/api/poke_api.dart';

enum PokemonState { initial, loading, loaded, empty, error }

class PokemonChangeNotifier with ChangeNotifier {
  bool isLoading = true;
  bool isFetching = false;
  int totalPages = 16;
  int currentPage = 0;

  late List<Result> items = [];
  late List<Result> result = [];
  late List<Result> itemsBak = [];
  final pokeApi = PokeApi();

  PokemonState prokemonState = PokemonState.initial;

  late ListPokemonsResponse listProkemonResponse;
  late AppException appException;

  PokemonChangeNotifier() {
    getPokemons(code: 200, isPag: true);
  }

  getPokemons({int code = 200, bool isPag = true}) async {
    setState(PokemonState.loading);
    try {
      listProkemonResponse = await pokeApi.getPokemons(
          limit: totalPages.toString(), offset: currentPage.toString());

      await delay();

      for (var item in listProkemonResponse.results) {
        items.add(item);
        itemsBak.add(item);
      }

      items.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });

      if (isPag) {
        currentPage == (currentPage + totalPages)
            ? currentPage
            : currentPage = (currentPage + totalPages);
      }

      isLoading = false;
      setState(PokemonState.loaded);
    } on AppException catch (appException) {
      setFailure(appException);
    }
    notifyListeners();
  }

  orderById() {
    items.sort((a, b) {
      return a.id.toInt().compareTo(b.id.toInt());
    });
    notifyListeners();
  }

  orderByName() {
    items.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    notifyListeners();
  }

  searchPokemon({required String query}) async {
    setState(PokemonState.loading);
    try {
      isLoading = false;

      result = items
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      items.clear();
      for (var item in result) {
        items.add(item);
      }

      setState(PokemonState.loaded);
    } on AppException catch (appException) {
      setFailure(appException);
    }
    notifyListeners();
  }

  restoreStorage() {
    setState(PokemonState.loading);
    try {
      items.clear();
      for (var element in itemsBak) {
        items.add(element);
      }

      items.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });

      setState(PokemonState.loaded);
    } on AppException catch (appException) {
      setFailure(appException);
    }
    notifyListeners();
  }

  refactIndex({required int id, required int index}) {
    items[index].id = id;
    return id.toString();
  }

  ListPokemonsResponse get pokemons => listProkemonResponse;

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
