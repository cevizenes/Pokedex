import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonTypeAndNameWidget extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonTypeAndNameWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? '',
                  style: UIHelper.getPokemonNameTextStyle(),
                ),
              ),
              Text(
                '#${pokemon.num ?? ''}',
                style: UIHelper.getPokemonNameTextStyle(),
              ),
            ],
          ),
          SizedBox(height: 0.02.sh),
          Chip(
            label: Text(
              pokemon.type?.join(', ') ?? '',
              style: UIHelper.getTypeChipTextStyle(),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.w),
            ),
          ),
        ],
      ),
    );
  }
}
