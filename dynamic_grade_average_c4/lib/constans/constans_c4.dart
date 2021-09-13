import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstanApp {
  static const mainColor = Colors.white;
  static const titleText = "Average Calculator";
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white);
  static BorderRadius borderRadius = BorderRadius.circular(24);
  static final TextStyle numberLessonsStyle = GoogleFonts.quicksand(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    color: Color(0xff501E4B),
  );

  static final TextStyle averageShowStyle = GoogleFonts.quicksand(
    fontSize: 45,
    fontWeight: FontWeight.w800,
    color: Color(0xff501E4B),
  );

  // ignore: non_constant_identifier_names
  static final EdgeInsets DropDownPadding =
      EdgeInsets.symmetric(horizontal: 7, vertical: 5);
}
