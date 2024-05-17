import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/core/utils/constants.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/state.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/inbox_view/widgets/inbox_view_body.dart';

import '../../../../generated/l10n.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModeCubit, ModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: ModeCubit.get(context).isDark
                  ? const Color(0xff26252A)
                  : const Color(0xffF2F1F6),
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: ModeCubit.get(context).isDark
                    ? const Color(0xff26252A)
                    : kWhiteColor,
                leading: Icon(
                  Icons.notifications_active,
                  color: ModeCubit.get(context).isDark
                      ? const Color(0xffA8A8AA)
                      : Colors.black,
                  size: 25,
                ),
                title: Text(
                  'Menouf',
                  style: TextStyle(
                    color: const Color(0xff69D0B7),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+100',
                          style: TextStyle(
                            color: ModeCubit.get(context).isDark
                                ? const Color(0xffA8A8AA)
                                : Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          S.of(context).my_karma,
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                bottom: TabBar(
                  indicatorColor: Colors.teal,
                  labelColor: Colors.teal,
                  unselectedLabelColor: ModeCubit.get(context).isDark
                      ? const Color(0xffA8A8AA)
                      : Colors.black,
                  tabs: [
                    Tab(
                      child: Text(
                       S.of(context).notifications,
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        S.of(context).chat,
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: const InboxViewBody(),
            ),
          );
        });
  }
}
