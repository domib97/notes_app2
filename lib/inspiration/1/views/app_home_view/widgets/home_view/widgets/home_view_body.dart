import 'package:flutter/material.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/imge.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/voice_message.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/tweta_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            TwetaView(),
            BodyVoiceMessage(),
            ImageTweta(),
            BodyVoiceMessage(),
            TwetaView(),
            ImageTweta(),
            TwetaView(),
          ],
        ),
      ),
    );
  }
}
