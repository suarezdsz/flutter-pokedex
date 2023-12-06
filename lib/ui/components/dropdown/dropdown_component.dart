import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/core/services/state_api/pokemon_state/pokemon_state_api.dart';

const List<String> list = <String>['Number', 'Name'];

class DropdownButtonComponent extends StatefulWidget {
  const DropdownButtonComponent({super.key});

  @override
  State<DropdownButtonComponent> createState() =>
      DropdownButtonComponentState();
}

class DropdownButtonComponentState extends State<DropdownButtonComponent> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final pokemonChange = Provider.of<PokemonChangeNotifier>(context);
    return DropdownButton(
      icon: const Icon(Icons.align_horizontal_left_sharp),
      isExpanded: true,
      onChanged: (String? value) {
        setState(() {
          if (value == 'Name') {
            pokemonChange.orderByName();
          }
          if (value == 'Number') {
            pokemonChange.orderById();
          }
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
