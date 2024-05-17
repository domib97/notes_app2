import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app2/inspiration/1/core/utils/constants.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/state.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/home_view.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/me_view/me_view.dart';

import 'widgets/inbox_view/inbox_view.dart';

class AppHomeView extends StatefulWidget {
  const AppHomeView({super.key});

  static const String pageID = 'appHomeView';

  @override
  State<AppHomeView> createState() => _AppHomeViewState();
}

class _AppHomeViewState extends State<AppHomeView> {
  int pageIndex = 0;

  final pages = [
    const HomeView(),
    const InboxView(),
    const MeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModeCubit, ModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            // bottomNavigationBar
            bottomNavigationBar: Container(
              height: 70,
              decoration: BoxDecoration(
                color: ModeCubit.get(context).isDark
                    ? const Color(0xff26252A)
                    : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            pageIndex == 0
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 11, vertical: 6),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: kPrimaryColor,
                                    ),
                                    child: Image.asset(
                                      logoImage,
                                      color: Colors.white,
                                      width: 30,
                                    ),
                                  )
                                : Image.asset(
                                    logoImage,
                                    color: ModeCubit.get(context).isDark
                                        ? const Color(0xffBFBEC3)
                                        : const Color(0xff414045),
                                    width: 30,
                                  ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              S.of(context).home,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            pageIndex == 1
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 3),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: Colors.teal,
                                    ),
                                    child: const Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  )
                                : Icon(
                                    Icons.notifications,
                                    color: ModeCubit.get(context).isDark
                                        ? const Color(0xffBFBEC3)
                                        : const Color(0xff414045),
                                    size: 30,
                                  ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              S.of(context).inbox,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          pageIndex = 2;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            pageIndex == 2
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 3),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: Colors.orange,
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    color: ModeCubit.get(context).isDark
                                        ? const Color(0xffBFBEC3)
                                        : const Color(0xff414045),
                                    size: 30,
                                  ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              S.of(context).me,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            body: pages[pageIndex],
          );
        });
  }
}
