import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'dart:math';

//component
import 'package:pokedex/core/services/state_api/pokemon_state/pokemon_state_api.dart';
import 'package:pokedex/ui/components/images/imag_network_component.dart';
import '../label/label_title_component.dart';

//page
import 'package:pokedex/ui/pages/home/pages/details/details_page.dart';
import 'package:pokedex/data/response/detail_pokemon_response.dart';

//route
import 'package:pokedex/ui/routes/custom_page_router.dart';

//themes
import 'package:pokedex/ui/themes/style_color.dart';
import 'package:pokedex/ui/themes/style_font.dart';
import 'package:pokedex/data/source/api/poke_api.dart';

// ignore: must_be_immutable
class CardItemListComponent extends StatefulWidget {
  final String title;
  final String ur;
  final int index;
  final double height;
  final double width;
  const CardItemListComponent({
    Key? key,
    required this.title,
    required this.index,
    required this.ur,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<CardItemListComponent> createState() => _CardItemListComponentState();
}

class _CardItemListComponentState extends State<CardItemListComponent> {
  PokeApi pokeApi = PokeApi();

  @override
  Widget build(BuildContext context) {
    final pokemonChange = Provider.of<PokemonChangeNotifier>(context);
    final size = MediaQuery.of(context).size;
    return Card(
        elevation: 5,
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: FutureBuilder<DetailsPokemonResponse>(
              future: pokeApi.getPokemonDetails(ur: widget.ur),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return InkWell(
                      onTap: () {
                        final random = Random();

                        int index =
                            random.nextInt(ColorStyle().palletColor.length);

                        Color indexColor = ColorStyle().palletColor[index];

                        Navigator.of(context).push(CustomPageRouter(
                            child: DetailsPage(
                          color: indexColor,
                          types: snapshot.data!.types,
                          stats: snapshot.data!.stats,
                          abilities: snapshot.data!.abilities,
                          url: snapshot.data!.sprites.other.home.frontDefault,
                          code: snapshot.data!.id.toString(),
                          name: snapshot.data!.name,
                          kg: snapshot.data!.weight.toString(),
                          cm: snapshot.data!.height.toString(),
                        )));
                      },
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              child: Container(
                                height: widget.height * 0.7,
                                width: widget.width + (widget.width * 0.2),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  color: ColorStyle.secundaryColoGrey,
                                ),
                              )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: LabelTitleComponent(
                                      title: pokemonChange.refactIndex(
                                          id: snapshot.data!.id,
                                          index: widget.index),
                                      padding: 0,
                                      style: TextFontStyle.body14BlakStyle,
                                    ),
                                  )
                                ],
                              ),
                              ImageNetworkComponent(
                                url: snapshot.data!.sprites.frontDefault,
                                margin: 0,
                                height: size.height * 0.1,
                                width: size.height * 0.1,
                              ),
                              LabelTitleComponent(
                                title: widget.title,
                                padding: 1,
                                style: TextFontStyle.body16BlakStyle,
                              )
                            ],
                          ),
                        ],
                      ));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // Por defecto, muestra un loading spinner
                return const Center(child: CircularProgressIndicator());
              }),
        ));
  }
}
