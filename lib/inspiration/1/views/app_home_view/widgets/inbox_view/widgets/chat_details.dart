import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../shared/styles/mode/cubit.dart';

// ignore: must_be_immutable
class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({
    Key? key,
  }) : super(key: key);
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TooltipSample(),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                buildMyMassage(),
                buildMassage(),
                buildMassage(),
                buildMyMassage(),
                buildMassage(),
                buildMyMassage(),
                buildMassage(),
                buildMassage(),
                buildMyMassage(),
                buildMyMassage(),
                buildMyMassage(),
                buildMassage(),
                buildMyMassage(),
                buildMassage(),
                buildMassage(),
                buildMyMassage(),
              ],
            )),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ModeCubit.get(context).isDark
                          ? const Color(0xff26252A)
                          : Colors.grey.shade300,
                      style: BorderStyle.solid,
                      width: 1),
                  borderRadius: BorderRadiusDirectional.circular(15)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              padding: const EdgeInsetsDirectional.only(start: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      decoration: InputDecoration(
                          hintText: S.of(context).send_message_button,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.blue,
                    minWidth: 1,
                    height: 50.h,
                    child: const Icon(Icons.send),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildMassage() => Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              logoImage,
              width: 35.w,
            ),
            SizedBox(
              width: 12.w,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(15),
                    topEnd: Radius.circular(15),
                    bottomEnd: Radius.circular(15),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'اهلا',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );

Widget buildMyMassage() => Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.cyan.withOpacity(.6),
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(15),
                    topEnd: Radius.circular(15),
                    bottomStart: Radius.circular(15),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'hi, what is your name?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Image.asset(
              logoImage,
              width: 35.w,
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );

class TooltipSample extends StatelessWidget {
  const TooltipSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: S.of(context).soon,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ModeCubit.get(context).isDark
            ? const Color(0xff26252A)
            : Colors.white,
        boxShadow: [
          BoxShadow(
            color: ModeCubit.get(context).isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: 50,
      triggerMode: TooltipTriggerMode.longPress,
      padding: const EdgeInsets.all(8.0),
      preferBelow: false,
      textStyle: const TextStyle(
          fontSize: 21, color: Colors.red, fontWeight: FontWeight.bold),
      showDuration: const Duration(seconds: 2),
      waitDuration: const Duration(seconds: 1),
      margin: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 4),
      child: const Icon(
        Icons.call,
        color: Colors.red,
      ),
    );
  }
}