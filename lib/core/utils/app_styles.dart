import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'size_config.dart';

abstract class AppStyles {

  static TextStyle styleSemiBold12(context) {
    return TextStyle(
      color: AppColors.brown,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleSemiBold14(context) {
    return TextStyle(
      color: AppColors.white.withOpacity(0.20),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleBold16(context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle styleSemiBold16(context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleMedium16(context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleBold18(context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle styleMedium20(context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleBold32(context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle styleBold40(context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 40),
      fontWeight: FontWeight.w700,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
