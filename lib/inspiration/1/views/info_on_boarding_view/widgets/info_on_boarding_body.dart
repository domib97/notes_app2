import 'package:flutter/material.dart';
import 'package:notes_app2/inspiration/1/views/info_on_boarding_view/widgets/custom_info_page_view.dart';

class InfoOnBoardingViewBody extends StatefulWidget {
  const InfoOnBoardingViewBody({Key? key}) : super(key: key);

  @override
  _InfoOnBoardingViewBodyState createState() => _InfoOnBoardingViewBodyState();
}

class _InfoOnBoardingViewBodyState extends State<InfoOnBoardingViewBody> {
  PageController? infoPageController;

  @override
  void initState() {
    infoPageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/blue_background.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        CustomInfoPageView(infoPageController: infoPageController),
      ],
    );
  }
}
