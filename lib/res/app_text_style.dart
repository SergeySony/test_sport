import 'package:flutter/material.dart';
import 'package:test_project_bets/res/app_colors.dart';

class AppTextStyle {

  static TextStyle regular12 = const TextStyle(
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      color: AppColors.white_text_color
  );

  static TextStyle regular14 = const TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: AppColors.white_text_color
  );

  static TextStyle regular18 = const TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      color: AppColors.white_text_color
  );

  static TextStyle italic15 = const TextStyle(
      fontSize: 15,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      color: AppColors.gray_text_color
  );
}