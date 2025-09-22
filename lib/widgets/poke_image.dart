import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokemonImage extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonImage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokemonLogoPath = 'assets/images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokemonLogoPath,
            width: UIHelper.calculatePokemonImageSize(),
            height: UIHelper.calculatePokemonImageSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              width: UIHelper.calculatePokemonImageSize(),
              height: UIHelper.calculatePokemonImageSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: UIHelper.getTypeColor(pokemon.type![0]),
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
      ],
    );
  }
}
