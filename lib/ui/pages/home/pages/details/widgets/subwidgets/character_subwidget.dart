import 'package:flutter/material.dart';

//component
import 'package:pokedex/ui/themes/style_font.dart';
import 'package:pokedex/ui/components/divider/divider_vertical_component.dart';
//response
import 'package:pokedex/data/response/detail_pokemon_response.dart';

//Categoria SubWidget es una sub categoria que es para segmentar los Widgets que
//contienen una cantidad de graficos.

//CharactSubwidget muestra las caracteristicas de un pokemon
class CharactSubwidget extends StatefulWidget {
  final String kg;
  final String cm;
  final List<Abilities> abilities;
  const CharactSubwidget(
      {Key? key, required this.kg, required this.cm, required this.abilities})
      : super(key: key);

  @override
  CharactSubwidgetState createState() => CharactSubwidgetState();
}

class CharactSubwidgetState extends State<CharactSubwidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(top: 25, bottom: 10, left: 10),
        height: size.height * 0.15,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                child: ItemWH(
                  title: '${widget.kg} Kg',
                  descript: 'Weight',
                  icon: const Icon(
                    Icons.one_k_plus_outlined,
                    size: 32,
                  ),
                  padding: 3,
                  styleTitle: TextFontStyle.headLine32DarkStyle,
                  styleDescrip: TextFontStyle.headLine32DarkStyle,
                )),
            const DividerVerticalComponent(),
            Expanded(
                flex: 2,
                child: ItemWH(
                  title: '${widget.cm} CM',
                  descript: 'Height',
                  icon: const Icon(
                    Icons.height,
                    size: 32,
                  ),
                  padding: 3,
                  styleTitle: TextFontStyle.headLine32DarkStyle,
                  styleDescrip: TextFontStyle.headLine32DarkStyle,
                )),
            const DividerVerticalComponent(),
            Expanded(
                flex: 2,
                child: ItemAbilities(
                  abilities: widget.abilities,
                  descript: 'Moves',
                  padding: 3,
                )),
          ],
        ));
  }
}

class ItemWH extends StatelessWidget {
  final Icon icon;
  final String title;
  final String descript;
  final double padding;
  final TextStyle styleTitle;
  final TextStyle styleDescrip;
  const ItemWH({
    Key? key,
    required this.icon,
    required this.title,
    required this.descript,
    required this.padding,
    required this.styleTitle,
    required this.styleDescrip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon, Text(title)],
            ),
            Text(descript)
          ],
        ));
  }
}

class ItemAbilities extends StatefulWidget {
  final List<Abilities> abilities;
  final String descript;
  final double padding;
  const ItemAbilities(
      {Key? key,
      required this.descript,
      required this.abilities,
      required this.padding})
      : super(key: key);

  @override
  ItemAbilitiesState createState() => ItemAbilitiesState();
}

class ItemAbilitiesState extends State<ItemAbilities> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (var item in widget.abilities) {
      items.add(Text(
        item.ability.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      ));
    }
    return Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Column(children: items), Text(widget.descript)],
        ));
  }
}
