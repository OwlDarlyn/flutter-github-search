import 'dart:async';

import 'package:flutter/material.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.searchRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.accentPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.searchApp,
              style: getHeaderStyle(
                color: ColorManager.layer1,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(height: 16),
            CircularProgressIndicator(
              color: ColorManager.placeHolder,
            ),
          ],
        ),
      ),
    );
  }
}
