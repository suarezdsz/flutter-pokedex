import 'package:flutter/material.dart';
//component
import 'package:pokedex/ui/themes/style_font.dart';

import 'package:pokedex/ui/components/label/label_title_component.dart';
import 'package:pokedex/ui/components/buttons/button_icon_only_component.dart';

//theme
import 'package:pokedex/ui/themes/style_color.dart';

//Categoria Widget en mi caso utilizo este
//concepto para decir que este Widget viene siendo parte de una pagina en especifico
//solo uso exclusivo de esa pagina.

//Conforma App Bar de la pagina DetailsPage
class AppBarDetailWidget extends StatefulWidget {
  final String name;
  final String code;
  const AppBarDetailWidget({Key? key, required this.name, required this.code})
      : super(key: key);

  @override
  AppBarDetailWidgetState createState() => AppBarDetailWidgetState();
}

class AppBarDetailWidgetState extends State<AppBarDetailWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(top: 25, bottom: 10, left: 10),
        height: size.height * 0.1,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  ButtonIconOnlyComponent(
                      icon: const Icon(Icons.arrow_back, size: 32),
                      padding: 0,
                      bgColor: ColorStyle.primaryColorWhite,
                      press: () {
                        Navigator.of(context).pop();
                      }),
                  LabelTitleComponent(
                    title: widget.name,
                    padding: 2,
                    style: TextFontStyle.headLine32WhiteStyle,
                  )
                ],
              ),
            ),
            Expanded(
                flex: 0,
                child: LabelTitleComponent(
                  title: widget.code,
                  padding: 2,
                  style: TextFontStyle.subTitle1W500WhiteStyle,
                ))
          ],
        ));
  }
}
