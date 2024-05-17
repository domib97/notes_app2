import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/core/utils/constants.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';

class CustomNotificationContainer extends StatelessWidget {
  const CustomNotificationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: ModeCubit.get(context).isDark
              ? const Color(0xff26252A)
              : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: ModeCubit.get(context).isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                logoImage,
                width: 35,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).notification_receive,
                    style: TextStyle(
                      color: ModeCubit.get(context).isDark
                          ? Colors.white70
                          : Colors.grey[600],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Who is here now!',
                    style: TextStyle(
                      color: ModeCubit.get(context).isDark
                          ? Colors.white70
                          : Colors.grey[600],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              const Spacer(),
             Row(
                children: [
                  Text(
                    '1d ',
                    style: TextStyle(
                      color: ModeCubit.get(context).isDark
                          ? Colors.white70
                          : Colors.grey[600],
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    S.of(context).ago,
                    style: TextStyle(
                      color: ModeCubit.get(context).isDark
                          ? Colors.white70
                          : Colors.grey[600],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
