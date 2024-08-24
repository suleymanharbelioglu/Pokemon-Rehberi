import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/contants/constants.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/contants/ui_helper.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/model/pokemon_model.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/pages/detail_page.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/widgets/poke_img_and_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  PokeListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UiHelper.getColorFormType(pokemon.type![0]),
        child: Padding(
          padding: UiHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name ?? "N/A",
                style: Constants.getPokemonNameTextStyle(),
              ),
              Chip(
                label: Text(
                  pokemon.type![0],
                  style: Constants.getTypeChipTextStyle(),
                ),
              ),
              Expanded(child: PokeImgAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
