import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonDetailsWidget extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonDetailsWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.w)),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDetailsRow('Name:', pokemon.name),
            _buildDetailsRow('Height:', pokemon.height),
            _buildDetailsRow('Weight:', pokemon.weight),
            _buildDetailsRow('Spawn Time:', pokemon.spawnTime),
            _buildDetailsRow('Weakness:', pokemon.weaknesses),
            _buildDetailsRow('Pre Evolution:', pokemon.prevEvolution),
            _buildDetailsRow('Next Evolution:', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildDetailsRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: UIHelper.getPokemonDetailLabelTextStyle()),
        if (value is List && value.isNotEmpty)
          Text(value.join(', '), style: UIHelper.getPokemonDetailTextStyle())
        else if (value == null)
          Text(
            'There is no information!!',
            style: UIHelper.getPokemonDetailTextStyle(),
          )
        else
          Text(value.toString(), style: UIHelper.getPokemonDetailTextStyle()),
      ],
    );
  }
}
