import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_rehberi/contants/ui_helper.dart';
import 'package:pokemon_rehberi/model/pokemon_model.dart';

class PokeImgAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = "images/pokeball.png";

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UiHelper.calculatePokeImgAndBallSize(),
            height: UiHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? "",
              width: UiHelper.calculatePokeImgAndBallSize(),
              height: UiHelper.calculatePokeImgAndBallSize(),
              fit: BoxFit.fitHeight,
              errorWidget: (context, url, error) => Icon(Icons.ac_unit),
              placeholder: (context, url) => CircularProgressIndicator(
                color: UiHelper.getColorFormType(pokemon.type![0]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
