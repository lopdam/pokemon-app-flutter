import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokemon/values/colors.dart';
import 'package:shimmer/shimmer.dart';

class Util {
  // URL

  // Test
  static const String _BASE_URL = "https://pokeapi.co";

  // URL Configs
  static const String API_URL = "$_BASE_URL/api/v2/";

  static Size sizeScreen(BuildContext context) => MediaQuery.of(context).size;

  static Orientation orientationScreen(BuildContext context) =>
      MediaQuery.of(context).orientation;

  static Brightness brightnessScreen(BuildContext context) =>
      MediaQuery.of(context).platformBrightness;

  static Widget shimmer({required Widget child, bool enabled = true}) {
    return Shimmer.fromColors(
        child: child,
        enabled: enabled,
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor);
  }

  static void shortToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void longToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  // NETWORK STATUS
  static Future<bool> isNetworkAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      print("Currently connected to a celluar network");
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Currently connected to wifi network");
      return true;
    } else {
      print("Currently connected to no network");
      return false;
    }
  }

  static bool isEmpty(String? s) {
    return s == null || s.length == 0;
  }

  static Widget hideWidget({isHide = false, required Widget child}) {
    return isHide ? const SizedBox(width: 0, height: 0) : child;
  }
}
