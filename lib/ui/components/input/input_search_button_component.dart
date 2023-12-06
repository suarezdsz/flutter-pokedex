import 'package:flutter/material.dart';

//component
import './input_simplit_component.dart';
import '../buttons/button_icon_only_component.dart';

//themes
import 'package:pokedex/ui/themes/style_color.dart';

class InputSearchButtonComponent extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final double padding;
  final Color bgColor;
  final VoidCallback press;
  final TextEditingController controller;
  const InputSearchButtonComponent(
      {Key? key,
      required this.title,
      required this.height,
      required this.width,
      required this.padding,
      required this.bgColor,
      required this.press,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              flex: 1,
              child: ButtonIconOnlyComponent(
                  icon: const Icon(Icons.search),
                  padding: 5,
                  bgColor: ColorStyle.primaryColorRed,
                  press: press)),
          Expanded(
              flex: 3,
              child: InputSimplitComponent(
                bgColor: ColorStyle.primaryColorBlack,
                keyboardType: TextInputType.text,
                controller: controller,
              )),
        ]),
      ),
    );
  }
}
