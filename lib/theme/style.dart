import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/**
 * Created by IqbalMF on 2024.
 * Package theme
 */
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight boldest = FontWeight.w900;

double defaultMargin = 16.0;

class TextThemeApp {
  static TextStyle headline = GoogleFonts.poppins(
      color: ColorsApp.blackColor, fontWeight: bold, fontSize: 18);

  static TextStyle regularText = GoogleFonts.poppins(
    color: ColorsApp.blackColor,
    fontSize: 14,
    fontWeight: regular,
  );

  static TextStyle subtitleText = GoogleFonts.poppins(
    color: ColorsApp.greyColor2,
    fontSize: 12,
    fontWeight: regular,
  );
}