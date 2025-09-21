import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String pokemonLogoPath = 'assets/images/pokeball.png';
    String title = 'Pokedex';
    return Stack(
      children: [
        Align(alignment: Alignment.topLeft, child: Text(title)),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            pokemonLogoPath,
            width: 100,
            height: 100,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
