import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app2/inspiration/1/core/utils/constants.dart';
import 'package:notes_app2/inspiration/1/views/on_boarding/presentation/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, OnBoardingView.pageID));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/blue_background.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
          child: Image.asset(
            logoImage,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .6,
          ),
        ),
      ],
    );
  }
}
