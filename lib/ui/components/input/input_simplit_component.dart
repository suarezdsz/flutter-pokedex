import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//themes
import 'package:pokedex/ui/themes/style_font.dart';
import 'package:pokedex/core/services/state_api/pokemon_state/pokemon_state_api.dart';

class InputSimplitComponent extends StatefulWidget {
  final Color bgColor;

  final TextEditingController controller;
  final TextInputType keyboardType;
  const InputSimplitComponent(
      {Key? key,
      required this.bgColor,
      required this.controller,
      required this.keyboardType})
      : super(key: key);

  @override
  InputSimplitComponentState createState() => InputSimplitComponentState();
}

class InputSimplitComponentState extends State<InputSimplitComponent> {
  @override
  Widget build(BuildContext context) {
    final pokemonChange = Provider.of<PokemonChangeNotifier>(context);
    return TextFormField(
      onChanged: (value) {
        if (value.isEmpty) {
          pokemonChange.restoreStorage();
        }
      },
      style: TextFontStyle.subTitle16GreyStyle,
      textAlign: TextAlign.start,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      autocorrect: false,
      autofocus: false,
      decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          fillColor: Colors.black),
    );
  }
}
