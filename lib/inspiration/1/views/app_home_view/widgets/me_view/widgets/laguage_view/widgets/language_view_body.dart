import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../../main.dart';
import '../../../../../../../shared/styles/language.dart';
import '../../../../../../../shared/styles/language_constant.dart';
import '../../../../../../../shared/styles/mode/cubit.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Language),
        titleSpacing: 2.sp,
      ),
      body: Center(
        child: DropdownButton<Language>(
          dropdownColor: ModeCubit.get(context).isDark
              ? const Color(0xff26252A)
              : Colors.white,
          iconSize: 30,

          hint: Text(translation(context).change_Language,style: TextStyle(
              color: ModeCubit.get(context).isDark
                  ? Colors.white
                  : const Color(0xff26252A)
          ),),
          onChanged: (Language? language) async {
            if (language != null) {
              Locale _locale = await setLocale(language.languageCode);
              MyApp.setLocale(context, _locale);
            }
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}
