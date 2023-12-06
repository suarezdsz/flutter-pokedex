import 'package:flutter/material.dart';

//widgets
import './widgets/app_bar_home_widget.dart';
import './widgets/body_home_widget.dart';

//theme
import 'package:pokedex/ui/themes/style_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: ColorStyle.primaryColorRed,
        child: Column(
          children: const [AppBarHomeWidget(), BodyHomeWidget()],
        ),
      ),
    ));
  }
}
