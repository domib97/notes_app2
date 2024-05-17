import 'package:flutter/material.dart';

import 'widgets/info_on_boarding_body.dart';

class InfoOnBoardingView extends StatelessWidget {
  const InfoOnBoardingView({super.key});

  static const String pageID = 'InfoOnBoardingView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InfoOnBoardingViewBody(),
    );
  }
}
