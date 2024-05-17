import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/me_view/widgets/boosts_view/widgets/boosts_view_body.dart';

import '../../../../../../generated/l10n.dart';

class BoostsView extends StatelessWidget {
  const BoostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Boosts),
        titleSpacing: 2.sp,
      ),
      body: const BoostsViewBody(),
    );
  }
}
