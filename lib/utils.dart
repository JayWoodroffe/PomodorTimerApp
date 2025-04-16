import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

TextStyle textStyle(double size, [Color? color, FontWeight? fw]) {
  return GoogleFonts.bakbakOne(fontSize: size, color: color, fontWeight: fw);
}

//in seconds
List selectableTimes = [
  "300",
  "600",
  "900",
  "1200",
  "1500",
  "1800",
  "2100",
  "2400",
  "2700",
  "3000",
  "3300"
];
