import 'package:flutter/material.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/widgets/app_title.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            Expanded(
              child: PokemonList(),
            ),
          ],
        ),
      ),
    );
  }
}
