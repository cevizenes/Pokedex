import 'package:flutter/material.dart';
import 'package:pokedex/widgets/appbar_widget.dart';
import 'package:pokedex/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(),
          Expanded(child: PokemonList()),
        ],
      ),
    );
  }
}
