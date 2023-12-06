import 'package:flutter/material.dart';
//component
import 'package:pokedex/ui/themes/style_font.dart';

//response
import 'package:pokedex/data/response/detail_pokemon_response.dart';

//Categoria SubWidget es una sub categoria que es para segmentar los Widgets que
//contienen una cantidad de graficos.

//TypeSubwidget muestra los tipos de elementos que maneja un pokemon
class TypeSubwidget extends StatefulWidget {
  final List<Types> types;
  final Color color;
  const TypeSubwidget({Key? key, required this.types, required this.color})
      : super(key: key);

  @override
  TypeSubwidgetState createState() => TypeSubwidgetState();
}

class TypeSubwidgetState extends State<TypeSubwidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (var item in widget.types) {
      items.add(ItemText(
        color: widget.color,
        padding: 3,
        style: TextFontStyle.body16BlondBlakStyle,
        title: item.type.name,
      ));
    }

    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(top: 25, bottom: 10, left: 10),
        height: size.height * 0.1,
        width: size.width,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: items));
  }
}

class ItemText extends StatelessWidget {
  final String title;
  final double padding;
  final TextStyle style;
  final Color color;
  const ItemText(
      {Key? key,
      required this.title,
      required this.padding,
      required this.style,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Center(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
          child: Text(title, style: style),
        )),
      ),
    );
  }
}
