import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/arrow_up_don.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/popupBoutton.dart';

class TwetaComment extends StatelessWidget {
  const TwetaComment({super.key, required this.titel});
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          ModeCubit.get(context).isDark ? const Color(0xff26252A) : Colors.cyan,
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.accessibility),
              ),
              Icon(
                Icons.location_on,
                size: 15,
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
                  padding: EdgeInsets.only(right: 15), child: PopupButton()),
            ],
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            maxLines: 5,
                            "فيه حد g mgkedf hert hkrte jreh jrthj rt r jt wjer gjew  meg e mekrgm ",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),

                        /// icon comment
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.comment),
                            ),
                            Text(titel.toString()),
                          ],
                        ),
                      ],
                    )),
                const Expanded(child: ArrowUpDon()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
