import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/core/utils/constants.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';

import 'custom_gender_container.dart';

class InfoPageViewFirstItem extends StatelessWidget {
  const InfoPageViewFirstItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          S.of(context).gender_sub_title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 35.w,
            right: 35.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomGenderContainer(
                      image: logoImage,
                      title: S.of(context).female,
                      titleColor: pinkJodel,
                      imageColor: Colors.pink,
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  Expanded(
                    child: CustomGenderContainer(
                      image: logoImage,
                      title: S.of(context).male,
                      titleColor: blueJodel,
                      imageColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        Text(
          S.of(context).gender_Privacy,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
