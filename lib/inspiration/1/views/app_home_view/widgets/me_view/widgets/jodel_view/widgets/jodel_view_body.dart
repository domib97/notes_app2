import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/tweta_view.dart';

import '../../../../../../../generated/l10n.dart';

class JodelViewBody extends StatelessWidget {
  const JodelViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).My_X),
        titleSpacing: 2.sp,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            TwetaView(),
            TwetaView(),
            TwetaView(),
            TwetaView(),
            TwetaView(),
            TwetaView(),
          ],
        ),
      ),
    );
  }
}
