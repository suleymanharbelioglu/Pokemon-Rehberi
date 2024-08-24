import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = "Pokedex";
  static TextStyle getTitleTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calcutateFontSize(48));
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calcutateFontSize(24));
  }

  static TextStyle getTypeChipTextStyle() {
    return TextStyle(color: Colors.white, fontSize: _calcutateFontSize(20));
  }

  static _calcutateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else
      return (size * 0.7).sp;
  }

  static getPokeInfoLabelTextStyle() {
    return TextStyle(
        fontSize: _calcutateFontSize(20),
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static getPokeInfoTextStyle() {
    return TextStyle(fontSize: _calcutateFontSize(16), color: Colors.black);
  }
}
