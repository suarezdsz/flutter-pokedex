import 'package:flutter/material.dart';

//theme
import '../../themes/imag_url.dart';
import 'package:pokedex/ui/themes/style_font.dart';

//components
import '../images/imag_asset_component.dart';
import '../label/label_title_component.dart';

class LabelTitleIconComponent extends StatelessWidget {
  final String title;

  const LabelTitleIconComponent({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 1,
            child: ImageAssetComponent(
              height: 35,
              width: 35,
              margin: 5,
              url: pokeballUrl,
            )),
        Expanded(
            flex: 5,
            child: LabelTitleComponent(
              title: title,
              padding: 2,
              style: TextFontStyle.headLine32WhiteStyle,
            ))
      ],
    );
  }
}
