import 'package:flutter/material.dart';
import 'package:pokedex/ui/components/dropdown/dropdown_component.dart';

class ButtonIconRoundComponent extends StatelessWidget {
  final Icon icon;
  final double height;
  final double width;
  final double padding;
  final Color bgColor;
  final Color iconColor;
  final VoidCallback press;
  const ButtonIconRoundComponent(
      {Key? key,
      required this.icon,
      required this.height,
      required this.width,
      required this.padding,
      required this.bgColor,
      required this.iconColor,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(padding),
        child: TextButton(
          onPressed: () {},
          child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
              child: const DropdownButtonComponent()),
        ));
  }
}
