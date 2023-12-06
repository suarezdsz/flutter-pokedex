import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//component
import 'package:pokedex/ui/components/label/label_title_icon_component.dart';
import 'package:pokedex/ui/components/input/input_search_button_component.dart';
import 'package:pokedex/ui/components/buttons/button_icon_round_component.dart';

//theme
import 'package:pokedex/ui/themes/style_color.dart';

import 'package:pokedex/core/services/state_api/pokemon_state/pokemon_state_api.dart';

//Categoria Widget en mi caso utilizo este
//concepto para decir que este Widget viene siendo parte de una pagina en especifico
//solo uso exclusivo de esa pagina.

//AppBarHomeWidget es el Widget superior que contiene la pagina Home.
class AppBarHomeWidget extends StatefulWidget {
  const AppBarHomeWidget({Key? key}) : super(key: key);

  @override
  AppBarHomeWidgetState createState() => AppBarHomeWidgetState();
}

class AppBarHomeWidgetState extends State<AppBarHomeWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pokemonChange = Provider.of<PokemonChangeNotifier>(context);
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(top: 25, bottom: 10, left: 10),
        height: size.height * 0.23,
        width: size.width,
        color: ColorStyle.primaryColorRed,
        child: Column(
          children: [
            const LabelTitleIconComponent(title: 'Pokédex'),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: InputSearchButtonComponent(
                    bgColor: Colors.white,
                    height: size.height * 0.07,
                    width: size.width * 0.75,
                    padding: 10,
                    title: 'Search',
                    controller: controller,
                    press: () {
                      if (controller.text.isNotEmpty) {
                        pokemonChange.searchPokemon(query: controller.text);
                      } else {
                        pokemonChange.getPokemons(code: 200, isPag: false);
                      }
                    },
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: ButtonIconRoundComponent(
                        icon: const Icon(Icons.align_horizontal_left_rounded),
                        height: size.height * 0.07,
                        width: size.height * 0.07,
                        padding: 5,
                        bgColor: ColorStyle.primaryColorWhite,
                        iconColor: ColorStyle.primaryColorRed,
                        press: () {
                          //pokemonChange.orderById();
                          //   pokemonChange.restoreStorage();
                        })),
              ],
            )
          ],
        ));
  }
}
