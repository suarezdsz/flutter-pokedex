import 'package:flutter/material.dart';

//widgets
import '../widgets/subwidgets/type_subwidget.dart';
import '../widgets/subwidgets/character_subwidget.dart';
import '../widgets/subwidgets/stats_subwidget.dart';

//response
import 'package:pokedex/data/response/detail_pokemon_response.dart';

//Categoria Widget en mi caso utilizo este
//concepto para decir que este Widget viene siendo parte de una pagina en especifico
//solo uso exclusivo de esa pagina.

//Conforma el cuerpo de la pagina DetailsPage
class BodyDetailWidget extends StatefulWidget {
  final List<Types> type;
  final List<Stats> stats;
  final List<Abilities> abilities;
  final String kg;
  final String cm;
  final Color color;
  const BodyDetailWidget(
      {Key? key,
      required this.type,
      required this.stats,
      required this.abilities,
      required this.cm,
      required this.kg,
      required this.color})
      : super(key: key);

  @override
  BodyDetailWidgetState createState() => BodyDetailWidgetState();
}

class BodyDetailWidgetState extends State<BodyDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.6,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              TypeSubwidget(
                types: widget.type,
                color: widget.color,
              ),
              Text(
                'Abount',
                style: TextStyle(
                    color: widget.color,
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
              ),
              CharactSubwidget(
                  cm: widget.cm, kg: widget.kg, abilities: widget.abilities),
              SizedBox(
                  width: size.width * 0.9,
                  child: const Center(
                    child: Text(
                      "There is a plant seed on its back right from the day this Pokemon is born, The seed slowly grows larga.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Base Sats',
                style: TextStyle(
                    color: widget.color,
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
              ),
              StatsSubwidget(
                stats: widget.stats,
                color: widget.color,
              )
            ],
          ),
        ));
  }
}
