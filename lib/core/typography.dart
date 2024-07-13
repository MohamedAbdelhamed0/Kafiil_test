import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kafill_test/core/colors.dart';

class AppTypography {
  static final TextStyle heading1 = GoogleFonts.montserrat(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading2 = GoogleFonts.montserrat(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodyText = GoogleFonts.montserrat(
    fontSize: 16.0,
  );

  static final TextStyle labelText = GoogleFonts.montserrat(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textGreyColor);

  static final TextStyle insideFromFieldText = GoogleFonts.montserrat(
      fontSize: 16.0, fontWeight: FontWeight.w500, color: AppColors.textColor);

  static final TextStyle chipText = GoogleFonts.montserrat(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryColor);

  static final TextStyle appBarText = GoogleFonts.montserrat(
      fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.textColor);

  static final TextStyle countryText = GoogleFonts.montserrat(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF696F79));

  static final TextStyle capitalText = GoogleFonts.montserrat(
      fontSize: 12.0, fontWeight: FontWeight.w600, color: AppColors.textColor);

  static final TextStyle elevatedButtonText = GoogleFonts.montserrat(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white);

  static final TextStyle servicesText = GoogleFonts.montserrat(
      fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.white);

  static final TextStyle servicesName = GoogleFonts.montserrat(
      fontSize: 11.0, fontWeight: FontWeight.w500, color: Colors.black);

  static final TextStyle salaryText = GoogleFonts.montserrat(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF333333));

  static final TextStyle smallText = GoogleFonts.montserrat(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF696F79));

  static final TextStyle bottomNavigationBar = GoogleFonts.montserrat(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryColor);

  static final TextStyle textButtonText = GoogleFonts.montserrat(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryColor);

// Add more text styles as needed
}
