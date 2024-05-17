import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';
import 'widgets/create_tweet_view_body.dart';

class CreateTweetView extends StatelessWidget {
  const CreateTweetView({super.key});

  static const String pageID = 'createTweetView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30.sp,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 13.h, right: 13.w),
              child: Text(
                S.of(context).next,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: ModeCubit.get(context).isDark
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        body: const CreateTweetViewBody());
  }
}
