import 'package:flutter/material.dart';

//widgets
import './widgets/app_bar_detail_widget.dart';
import './widgets/body_detail_widget.dart';
import 'package:pokedex/ui/components/images/imag_network_component.dart';

//response
import 'package:pokedex/data/response/detail_pokemon_response.dart';

//Categoria Page de el Widget principal que esta conformados para la categoria Widget para asi formar
//la pagina de usuario ya sea Formulario, listas, vistas entre otros.

//DetailsPage es para mostrar los detalles de un pokemon.
class DetailsPage extends StatefulWidget {
  final List<Types> types;
  final List<Stats> stats;
  final List<Abilities> abilities;
  final String name;
  final String url;
  final String code;
  final String kg;
  final String cm;
  final Color color;
  const DetailsPage(
      {Key? key,
      required this.name,
      required this.url,
      required this.code,
      required this.types,
      required this.stats,
      required this.abilities,
      required this.kg,
      required this.cm,
      required this.color})
      : super(key: key);

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(5),
        color: widget.color,
        child: Stack(
          children: [
            AppBarDetailWidget(code: widget.code, name: widget.name),
            Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(0.1),
                  child: BodyDetailWidget(
                    abilities: widget.abilities,
                    type: widget.types,
                    cm: widget.cm,
                    kg: widget.kg,
                    stats: widget.stats,
                    color: widget.color,
                  ),
                )),
            Positioned(
                top: size.height * 0.1,
                child: SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                  child: Center(
                      child: ImageNetworkComponent(
                          height: size.height * 0.4,
                          width: size.height * 0.4,
                          margin: 1,
                          url: widget.url)),
                )),
          ],
        ),
      ),
    );
  }
}
