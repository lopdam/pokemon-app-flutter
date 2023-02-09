import 'package:flutter/material.dart';

class AppColors {
  static const Color bayteqBlue = Color(0xff26465B);
  static const Color bayteqOrange = Color(0xffE86341);
  static const Color bayteqLightBlue = Color(0xff99A8B2);

  static const MaterialColor colorPrimary = MaterialColor(0xff26465B, const {
    50: Color(0x8026465B),
    75: Color(0xBF26465B),
  });

  static const MaterialColor colorPrimaryDark =
      MaterialColor(0xff26465B, const {
    50: Color(0x8026465B),
    75: Color(0xBF26465B),
  });


  static const Color lightGray = Color(0xFFbfbfbd);
  static const Color gray = Color(0xFF8B8B8B);

  static const Color yellow = Color(0xFFE88500);
  static const Color green = Color(0xFF009c41);
  static const Color red = Color(0xFFff0000);
  static const Color blue = Color(0xFF0000FF);

  // Shimmer Colors
  static final Color shimmerBackground = Colors.grey.shade300;
  static final Color shimmerBaseColor = Colors.grey.shade300;
  static final Color shimmerHighlightColor = Colors.grey.shade100;
}
