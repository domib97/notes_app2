import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';

import 'custom_user_group.dart';

class InfoPageViewThirdItem extends StatelessWidget {
  const InfoPageViewThirdItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          S.of(context).group_sub_title,
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
            left: 10.w,
            right: 10.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                   Expanded(
                    child: CustomUserGroupContainer(
                      image: 'assets/images/graduate.png',
                      title:  S.of(context).university_student,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                   Expanded(
                    child: CustomUserGroupContainer(
                      image: 'assets/images/bag.png',
                      title:  S.of(context).emplyee,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                   Expanded(
                    child: CustomUserGroupContainer(
                      image: 'assets/images/smile.png',
                      title:  S.of(context).apprentice,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                   Expanded(
                    child: CustomUserGroupContainer(
                      image: 'assets/images/school-bag.png',
                      title:  S.of(context).high_school_graduate,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                   Expanded(
                    child: CustomUserGroupContainer(
                      image: 'assets/images/magician-hat.png',
                      title:  S.of(context).high_school_student,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                   Expanded(
                    child: CustomUserGroupContainer(
                      image: 'assets/images/aliens.png',
                      title:  S.of(context).other,
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
           S.of(context).group_Privacy,
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
