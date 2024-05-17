import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, this.title, this.subTitle, this.image})
      : super(key: key);

  final String? title;
  final String? subTitle;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Image.asset(
              image!,
            ),
          ),
          const Spacer(),
          Text(
            title!,
            style: TextStyle(
                fontSize: 25.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            subTitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
