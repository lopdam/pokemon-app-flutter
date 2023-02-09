import 'dart:async';

import 'package:pokemon/ui/views/home/home_view.dart';
import 'package:pokemon/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/values/dimens.dart';
import 'package:shimmer/shimmer.dart';

class SplashView extends StatefulWidget {
  static const String route = "/";

  @override
  _SplashView createState() => _SplashView();
}

class _SplashView extends State<SplashView>
    with SingleTickerProviderStateMixin {
  Timer? _delaySplash;

  final int _delayMillis = 2000;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
    _sendToApp();
  }

  @override
  void dispose() {
    _controller.dispose();
    _delaySplash!.cancel();
    super.dispose();
  }

  void _sendToApp() async {
    _delaySplash = Timer(Duration(milliseconds: _delayMillis), () {
      Navigator.of(context).pushReplacementNamed(HomeView.route);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.colorPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.margin),
                child: Image.asset('assets/images/pikachu.png'))),
        const Spacer(
          flex: 1,
        ),
        Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: AppColors.bayteqBlue,
          child: Image.asset(
            'assets/images/logo.png',
            color: Colors.white,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
