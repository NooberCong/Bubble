import 'package:flutter/material.dart';

const List<String> svgs = [
  "assets/images/like.svg",
  "assets/images/heart.svg",
  "assets/images/poo.svg",
  "assets/images/flower.svg",
  "assets/images/rose.svg",
  "assets/images/waving-hand.svg",
  "assets/images/money.svg",
  "assets/images/fire.svg"
];

Color colorForSvg(String svgAssetName, Color defaultColor) {
  return svgAssetName == "assets/images/like.svg" ? defaultColor : null;
}
