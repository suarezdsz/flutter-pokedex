import 'package:flutter/material.dart';

//theme
import 'package:pokedex/ui/themes/style_color.dart';

class DividerVerticalComponent extends StatelessWidget {
  const DividerVerticalComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: 1,
      color: ColorStyle.primaryColorGrey,
    );
  }
}
