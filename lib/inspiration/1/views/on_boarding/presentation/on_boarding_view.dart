import 'package:flutter/material.dart';
import 'package:notes_app2/inspiration/1/views/on_boarding/presentation/widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);
  static const String pageID = 'onBoardingView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}
