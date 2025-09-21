import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.w)),
      elevation: 3,
      shadowColor: Colors.white,
      color: Colors.red.shade200,
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pokemon.name!, style: UIHelper.getPokemonNameTextStyle()),
            Chip(
              label: Text(
                pokemon.type![0],
                style: UIHelper.getTypeChipTextStyle(),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
