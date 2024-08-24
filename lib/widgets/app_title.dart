import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_rehberi/contants/constants.dart';
import 'package:pokemon_rehberi/contants/ui_helper.dart';

class AppTitle extends StatefulWidget {
   AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  String pokeballImageUrl = "images/pokeball.png";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UiHelper.getAppTitleWdigetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UiHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.title,
                style: Constants.getTitleTextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              pokeballImageUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
