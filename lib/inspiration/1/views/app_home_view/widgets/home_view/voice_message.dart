import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/popupBoutton.dart';

import '../../../../shared/styles/mode/cubit.dart';

class BodyVoiceMessage extends StatefulWidget {
  const BodyVoiceMessage({super.key});

  @override
  State<BodyVoiceMessage> createState() => _BodyVoiceMessageState();
}

bool ispas = true;

class _BodyVoiceMessageState extends State<BodyVoiceMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          ModeCubit.get(context).isDark ? const Color(0xff26252A) : Colors.cyan,
      height: 130.h,
      width: 350.w,
      child: Column(
        children: [
          const Row(
            children: [
              // IconButton list
              //

              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.0),
                child: Icon(
                  Icons.location_on,
                  size: 12,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "El Shorouk City",
                    ),
                    Text(
                      " . 1min",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: PopupButton(),
              ),
            ],
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    iconSize: 45,
                    onPressed: () {
                      setState(() {
                        ispas = !ispas;
                      });
                    },
                    icon: ispas
                        ? const Icon(Icons.play_arrow)
                        : const Icon(Icons.pause),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Slider(
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue,
                    value: 0,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
