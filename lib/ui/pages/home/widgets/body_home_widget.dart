import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//component
import 'package:pokedex/ui/components/images/imag_asset_component.dart';
import 'package:pokedex/ui/components/cards/card_item_list_component.dart';

//http
import 'package:pokedex/data/source/api/poke_api.dart';
//state
import 'package:pokedex/core/services/state_api/pokemon_state/pokemon_state_api.dart';

//themes
import 'package:pokedex/ui/themes/imag_url.dart';

//Categoria Widget en mi caso utilizo este
//concepto para decir que este Widget viene siendo parte de una pagina en especifico
//solo uso exclusivo de esa pagina.

//en este caso este es el cuerpo de la Pagina Home.
class BodyHomeWidget extends StatefulWidget {
  const BodyHomeWidget({Key? key}) : super(key: key);

  @override
  BodyHomeWidgetState createState() => BodyHomeWidgetState();
}

class BodyHomeWidgetState extends State<BodyHomeWidget> {
  PokeApi pokeApi = PokeApi();
  ScrollController scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(onScrollUpdated);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.75,
        width: size.width * 0.95,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child:
            Consumer<PokemonChangeNotifier>(builder: (context, itemChange, _) {
          switch (itemChange.state) {
            case PokemonState.initial:
              return const Expanded(
                  child: Center(child: CircularProgressIndicator()));
            case PokemonState.loading:
              return const Expanded(
                  child: Center(child: CircularProgressIndicator()));
            case PokemonState.loaded:
              return Scrollbar(
                  child: GridView.builder(
                      controller: scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: itemChange.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardItemListComponent(
                          index: index,
                          title: itemChange.items[index].name,
                          ur: itemChange.items[index].url.substring(18),
                          height: size.height * 0.11,
                          width: size.width * 0.25,
                        );
                      }));
            case PokemonState.empty:
              return Container();
            case PokemonState.error:
              return const Center(
                  child: ImageAssetComponent(
                height: 250,
                width: 250,
                margin: 5,
                url: error404,
              ));
            default:
              return const Expanded(
                  child: Center(child: CircularProgressIndicator()));
          }
        }));
  }

  void onScrollUpdated() async {
    var maxScroll = scrollController.position.maxScrollExtent;
    var currentPosition = scrollController.position.pixels;

    if (currentPosition == maxScroll) {
      var state = Provider.of<PokemonChangeNotifier>(context, listen: false);

      await Future.delayed(const Duration(seconds: 2));

      state.getPokemons(code: 200, isPag: true);
    }
  }
}
