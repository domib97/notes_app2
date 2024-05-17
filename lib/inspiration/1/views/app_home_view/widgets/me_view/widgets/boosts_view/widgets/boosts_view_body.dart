import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import '../../../../../../../core/utils/constants.dart';
import '../../../../../../../shared/styles/mode/cubit.dart';

class BoostsViewBody extends StatefulWidget {
  const BoostsViewBody({Key? key}) : super(key: key);

  @override
  State<BoostsViewBody> createState() => _BoostsViewBodyState();
}

int containerIndex = 0;

class _BoostsViewBodyState extends State<BoostsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.rocket_launch,
          color: const Color(0xffBCBDF6),
          size: 32.sp,
        ),
        Text(
          S.of(context).Boosts_X,
          style: TextStyle(
              color: const Color(0xffBCBDF6),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          S.of(context).boost_sub_title,
          style: TextStyle(
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  containerIndex = 0;
                  setState(() {});
                },
                child: containerIndex == 0
                    ? customContainer(
                        context,
                        boostsNumber: 5,
                        boostsCost: 24.00,
                        hasOffer: false,
                        isPressed: true,
                      )
                    : customContainer(
                        context,
                        boostsNumber: 5,
                        boostsCost: 24.00,
                        hasOffer: false,
                        isPressed: false,
                      )),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                InkWell(
                    onTap: () {
                      containerIndex = 1;
                      setState(() {});
                    },
                    child: containerIndex == 1
                        ? customContainer(
                            context,
                            boostsNumber: 10,
                            boostsCost: 15.00,
                            hasOffer: true,
                            savePercent: "37%",
                            isPressed: true,
                          )
                        : customContainer(
                            context,
                            boostsNumber: 10,
                            boostsCost: 15.00,
                            hasOffer: true,
                            savePercent: "37%",
                            isPressed: false,
                          )),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffBCBDF6),
                    borderRadius: BorderRadiusDirectional.circular(60),
                  ),
                  height: 30.h,
                  width: 90.w,
                  child: Center(
                    child: Text(
                      S.of(context).most_popular,
                      style: TextStyle(
                        color: const Color(0xff403F44),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
                onTap: () {
                  containerIndex = 2;
                  setState(() {});
                },
                child: containerIndex == 2
                    ? customContainer(
                        context,
                        boostsNumber: 30,
                        boostsCost: 9.33,
                        hasOffer: true,
                        savePercent: "61%",
                        isPressed: true,
                      )
                    : customContainer(
                        context,
                        boostsNumber: 30,
                        boostsCost: 9.33,
                        hasOffer: true,
                        savePercent: "61%",
                        isPressed: false,
                      ))
          ],
        ),
        GestureDetector(
          onTap: () => print("containerIndex = $containerIndex"),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.09,
              decoration: BoxDecoration(
                color: purpleColor,
                borderRadius: BorderRadiusDirectional.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    S.of(context).boost_now,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.27,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: const BoxDecoration(
                      color: Color(0xff7B7DAD),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).egp,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                        Text(
                          '149.99 ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget customContainer(context,
        {String? savePercent,
        required int boostsNumber,
        required double boostsCost,
        required bool hasOffer,
        required bool isPressed}) =>
    Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 16.0, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          border: isPressed
              ? Border.all(
                  color: purpleColor, style: BorderStyle.solid, width: 4)
              : Border.all(style: BorderStyle.none),
          boxShadow: [
            BoxShadow(
              color: ModeCubit.get(context).isDark
                  ? Colors.grey.withOpacity(0.15)
                  : Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: ModeCubit.get(context).isDark
              ? const Color(0xff403F44)
              : Colors.white,
          borderRadius: BorderRadiusDirectional.circular(8),
        ),
        height: MediaQuery.of(context).size.height * 0.29,
        width: MediaQuery.of(context).size.width * 0.28,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            hasOffer
                ? Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffBCBDF6),
                      borderRadius: BorderRadiusDirectional.circular(6),
                    ),
                    height: 25.h,
                    width: 90.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).save,
                          style: TextStyle(
                            color: const Color(0xff403F44),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          savePercent!,
                          style: TextStyle(
                            color: Color(0xff403F44),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            Text(
              "$boostsNumber",
              style: TextStyle(
                  color: grayColor,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              S.of(context).Boosts,
              style: TextStyle(
                  color: grayColor,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$boostsCost",
                  style: TextStyle(
                    color: grayColor,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  S.of(context).egp,
                  style: TextStyle(
                    color: grayColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              S.of(context).each,
              style: TextStyle(
                color: grayColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
