import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import 'package:notes_app2/inspiration/1/shared/components/components.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/state.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/me_view/widgets/boosts_view/boosts_view.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/me_view/widgets/jodel_view/jodel_view.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/me_view/widgets/laguage_view/language_view.dart';

class MeViewBody extends StatefulWidget {
  const MeViewBody({Key? key}) : super(key: key);

  @override
  State<MeViewBody> createState() => _MeViewBodyState();
}

bool val = false;

class _MeViewBodyState extends State<MeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModeCubit, ModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16),
                    child: Text(
                      S.of(context).My_X_title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.symmetric(
                        vertical: 16, horizontal: 12),
                    width: double.maxFinite - 32,
                    height: 240,
                    decoration: BoxDecoration(
                      color: ModeCubit.get(context).isDark
                          ? const Color(0xff26252A)
                          : Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: ModeCubit.get(context).isDark
                              ? Colors.black.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () => navigateTo(context, JodelView()),
                            child: settingItem(text: S.of(context).My_X)),
                        const Divider(
                          thickness: 2,
                        ),
                        InkWell(
                            onTap: () => navigateTo(context, LanguageView()),
                            child: settingItem(text: S.of(context).Language)),
                        const Divider(
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.only(end: 8),
                                child: Icon(Icons.dark_mode_outlined),
                              ),
                              Text(
                                S.of(context).dark_Mode,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              Switch(
                                value: val,
                                onChanged: (value) {
                                  ModeCubit.get(context).changeAppMode();
                                  ModeCubit.get(context).isDark
                                      ? val = true
                                      : val = false;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 32, vertical: 8),
                    child: Text(
                      S.of(context).power,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () => navigateTo(context, const BoostsView()),
                      child: Container(
                        margin: const EdgeInsetsDirectional.symmetric(
                            vertical: 16, horizontal: 12),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff8274E7),
                              Color(0xff3D8AF3),
                            ],
                          ),
                          borderRadius: BorderRadiusDirectional.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: ModeCubit.get(context).isDark
                                  ? Colors.grey.withOpacity(0.15)
                                  : Colors.grey.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              vertical: 8),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.rocket_launch,
                                color: Colors.white,
                                size: 32,
                              ),
                              Text(
                                '0 ${S.of(context).Boosts}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}

Widget settingItem({
  required String text,
}) =>
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
