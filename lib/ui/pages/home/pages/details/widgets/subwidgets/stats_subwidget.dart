import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

//response
import 'package:pokedex/data/response/detail_pokemon_response.dart';

//Categoria SubWidget es una sub categoria que es para segmentar los Widgets que
//contienen una cantidad de graficos.

//StatsSubwidget muestra la lista de capacidades de un pokemon
class StatsSubwidget extends StatefulWidget {
  final List<Stats> stats;
  final Color color;
  const StatsSubwidget({Key? key, required this.stats, required this.color})
      : super(key: key);

  @override
  StatsSubwidgetState createState() => StatsSubwidgetState();
}

class StatsSubwidgetState extends State<StatsSubwidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> items = [];
    for (var item in widget.stats) {
      items.add(
        ItemStats(
          indexName: item.stat.name,
          value: item.baseStat.toString(),
          color: widget.color,
        ),
      );
    }

    return Container(
        padding: const EdgeInsets.only(top: 25, bottom: 10, left: 10),
        width: size.width,
        child: Column(children: items));
  }
}

class ItemStats extends StatelessWidget {
  final String value;
  final String indexName;
  final Color color;
  const ItemStats(
      {Key? key,
      required this.value,
      required this.indexName,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              getIndexNeme(indexName),
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 18),
            )),
        Container(
          height: size.height * 0.05,
          width: 1,
          color: Colors.black,
        ),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(value),
            )),
        Expanded(
            flex: 6,
            child: Center(
                child: LinearProgressBar(
              maxSteps: 100,
              progressType:
                  LinearProgressBar.progressTypeLinear, // Use Linear progress
              currentStep: int.parse(value),
              progressColor: color,
              backgroundColor: Colors.grey,
            )))
      ],
    );
  }

  getIndexNeme(String index) {
    switch (index) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'STAK';
      case 'special-defense':
        return 'SDEF';
      case 'speed':
        return 'SPD';
      default:
        return 'NA';
    }
  }
}
