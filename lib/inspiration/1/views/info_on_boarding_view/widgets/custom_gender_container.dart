import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGenderContainer extends StatelessWidget {
  const CustomGenderContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.titleColor,
      required this.imageColor});

  final String image;
  final Color imageColor;
  final String title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 70.w,
              color: imageColor,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
