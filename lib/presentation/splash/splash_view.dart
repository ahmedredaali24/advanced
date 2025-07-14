import 'dart:async';

import 'package:advanced_app/presentation/resources/color_manger.dart';
import 'package:advanced_app/presentation/resources/route_manager.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/const_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _starDelay() {
    _timer = Timer(const Duration(seconds: AppConstant.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.of(context).pushReplacementNamed(RouteName.onboardingRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _starDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManger.primary,
      body: Center(
        child: Image(
          image: AssetImage(ImageAsset.splashLogo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
