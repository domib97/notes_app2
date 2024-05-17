import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import 'package:notes_app2/inspiration/1/views/info_on_boarding_view/info_on_boarding.dart';

class LocationViewBody extends StatelessWidget {
  const LocationViewBody({super.key});

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
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(
                flex: 3,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset('assets/images/location.png')),
              const Spacer(
                flex: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Text(
                          S.of(context).location_sub_title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.20,
                          vertical: 20,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, InfoOnBoardingView.pageID);
                        },
                        child: Text(
                          S.of(context).allow_location,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
