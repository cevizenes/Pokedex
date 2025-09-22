import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_image.dart';
import 'package:pokedex/widgets/pokemon_detail_widget.dart';
import 'package:pokedex/widgets/pokemon_type_name_widget.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokemonLogoPath = 'assets/images/pokeball.png';
    return Scaffold(
      backgroundColor: UIHelper.getTypeColor(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                color: Colors.white,
                iconSize: 30.w,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            PokemonTypeAndNameWidget(pokemon: pokemon),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(
                      pokemonLogoPath,
                      height: 0.10.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.08.sh,
                    child: PokemonDetailsWidget(pokemon: pokemon),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.15.sh,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
