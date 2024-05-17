import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowUpDon extends StatefulWidget {
  const ArrowUpDon({super.key});

  @override
  State<ArrowUpDon> createState() => _ArrowUpDonState();
}

class _ArrowUpDonState extends State<ArrowUpDon> {
  int es = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          // icon arrow_drop_up
          onTap: () {
            if (es < 3) {
              es++;
            }
            setState(() {});
          },
          child: Icon(Icons.keyboard_arrow_up_outlined, size: 50.sp),
        ),
        Text(
          es.toString(),
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
        InkWell(
          onTap: () {
            if (es >= 1) {
              es--;
            }
            setState(() {});
          },
          child: Icon(Icons.keyboard_arrow_down_outlined, size: 50.sp),
        ),
      ],
    );
  }
}
