import 'package:flutter/material.dart';

class LabelTitleComponent extends StatelessWidget {
  final String title;
  final double padding;
  final TextStyle style;
  const LabelTitleComponent({
    Key? key,
    required this.title,
    required this.padding,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(title, style: style),
    );
  }
}
