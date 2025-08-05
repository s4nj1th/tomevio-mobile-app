import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle serif({
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  Color? color,
  double? height,
  TextDecoration? decoration,
  List<Shadow>? shadows,
}) {
  return GoogleFonts.averiaSerifLibre(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    color: color,
    height: height,
    decoration: decoration,
    shadows: shadows,
  );
}

TextStyle sans({
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  Color? color,
  double? height,
  TextDecoration? decoration,
  List<Shadow>? shadows,
}) {
  return GoogleFonts.atkinsonHyperlegible(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    color: color,
    height: height,
    decoration: decoration,
    shadows: shadows,
  );
}
