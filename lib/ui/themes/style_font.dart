import 'package:flutter/material.dart';

//color
import './style_color.dart';

class TextFontStyle {
  static const headLine32WhiteStyle = TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: ColorStyle.primaryColorWhite,
      letterSpacing: 1);

  static const headLine32DarkStyle = TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: ColorStyle.primaryColorBlack,
      letterSpacing: 1);

  static const subTitle1W500WhiteStyle = TextStyle(
      fontSize: 27.0,
      fontWeight: FontWeight.w700,
      color: ColorStyle.primaryColorWhite,
      letterSpacing: 1);

  static const subTitle16GreyStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: ColorStyle.primaryColorGrey,
      letterSpacing: 0);

  static const body16BlakStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: ColorStyle.primaryColorBlack,
  );

  static const body16BlondBlakStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: ColorStyle.primaryColorBlack,
  );

  static const body14BlakStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: ColorStyle.primaryColorGrey,
  );
}
