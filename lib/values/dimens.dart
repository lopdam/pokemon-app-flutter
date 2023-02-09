import 'package:pokemon/values/colors.dart';
import 'package:flutter/material.dart';

class AppDimens {
  static const double margin = 16;
  static const double min_margin = 8;


  static dividerItemDecoration() => BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.2, color: AppColors.gray)));

  static Widget toGrayScale({required Widget child}) {
    const ColorFilter _greyscale = ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);

    return ColorFiltered(
      colorFilter: _greyscale,
      child: child,
    );
  }
}
