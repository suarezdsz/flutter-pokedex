import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//ui
import 'package:pokedex/ui/pages/home/home_page.dart';

//state
import 'package:pokedex/core/services/state_api/pokemon_state/pokemon_state_api.dart';

void main() {
  runApp(const MyApp());
}

/// Inicio de la aplicacion
///
/// la aplicacion esta estructurada siguiendo los principios SOLID el cual su organizacion
/// esta forma para el crecimiento de dicho proyecto.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PokemonChangeNotifier()),
        ],
        child: MaterialApp(
          title: 'PokeDex',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: const HomePage(),
        ));
  }
}
