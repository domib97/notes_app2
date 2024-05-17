import 'package:flutter/material.dart';
import 'package:notes_app2/inspiration/1/views/info_on_boarding_view/widgets/info_page_view_third_item.dart';

import 'info_page_view_first_item.dart';
import 'info_page_view_second_item.dart';

class CustomInfoPageView extends StatelessWidget {
  const CustomInfoPageView({Key? key, @required this.infoPageController})
      : super(key: key);
  final PageController? infoPageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: infoPageController,
      children: const [
        InfoPageViewFirstItem(),
        InfoPageViewSecondItem(),
        InfoPageViewThirdItem(),
      ],
    );
  }
}
