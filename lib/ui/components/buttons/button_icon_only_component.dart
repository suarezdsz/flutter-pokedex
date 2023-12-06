import 'package:flutter/material.dart';

class ButtonIconOnlyComponent extends StatelessWidget {
  final Icon icon;
  final double padding;
  final Color bgColor;
  final VoidCallback press;
  const ButtonIconOnlyComponent(
      {Key? key,
      required this.icon,
      required this.padding,
      required this.bgColor,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: IconButton(
        icon: icon,
        onPressed: press,
        color: bgColor,
      ),
    );
  }
}
