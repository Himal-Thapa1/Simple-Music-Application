import 'package:flutter/material.dart';

import 'colors.dart';

const regular = "Itim";

TextStyle myTextStyle(
    {family = regular, double? size = 14, color = whiteColor}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontFamily: family,
  );
}
