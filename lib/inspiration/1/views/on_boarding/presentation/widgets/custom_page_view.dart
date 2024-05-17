import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import 'page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, @required this.pageController})
      : super(key: key);
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: PageView(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        children:  [
          PageViewItem(
            image: 'assets/images/facebook.png',
            title:  S.of(context).local_title,
            subTitle:  S.of(context).local_sub_title,
          ),
          PageViewItem(
            image: 'assets/images/instagram.png',
            title:  S.of(context).relevant_title,
            subTitle:  S.of(context).relevant_sub_title,
          ),
          PageViewItem(
            image: 'assets/images/twitter.png',
            title:  S.of(context).simple_title,
            subTitle:  S.of(context).simple_sub_title,
          ),
        ],
      ),
    );
  }
}
