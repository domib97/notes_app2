import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';

class InfoPageViewSecondItem extends StatelessWidget {
  const InfoPageViewSecondItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
           S.of(context).age_sub_title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w700),
                cursorColor: Colors.grey.withOpacity(0.2),
                cursorHeight: 60,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 30),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              S.of(context).age_Privacy,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.white.withOpacity(0.6),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.32,
                vertical: 14.h,
              ),
              onPressed: () {},
              child: Text(
                S.of(context).next,
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              S.of(context).age_confirm,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
