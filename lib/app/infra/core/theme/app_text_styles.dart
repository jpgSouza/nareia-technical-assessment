import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../infra.dart';

class AppTextStyles {
  static final titleLarge = _baseTextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
  );

  static final titleMedium = _baseTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );

  static final labelExtraSmall = _baseTextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static final labelBoldLarge = _baseTextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final bodyCompactSmall = _baseTextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiary,
  );

  static final bodyCompactMedium = _baseTextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );

  static final bodyCompactLarge = _baseTextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle _baseTextStyle({
    String fontFamily = 'Lato',
    Color color = AppColors.textPrimary,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return GoogleFonts.getFont(
      fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
