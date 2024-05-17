import 'package:flutter/material.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/tweta_comment.dart';

import 'widgets/commentes.dart';

class HomeCommentTweta extends StatefulWidget {
  const HomeCommentTweta({super.key});

  @override
  State<HomeCommentTweta> createState() => _HomeCommentTwetaState();
}

class _HomeCommentTwetaState extends State<HomeCommentTweta> {
  final List ico = [
    const Icon(Icons.account_balance),
    const Icon(Icons.account_circle_sharp),
    const Icon(Icons.accessibility_sharp),
    const Icon(Icons.adobe)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TwetaComment(titel: "4"),
        Container(
          color: ModeCubit.get(context).isDark ? Colors.black : Colors.white,
          child: const Divider(
            height: 02,
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: ico.length,
            itemBuilder: (context, index) {
              return Commentes(
                icon: ico[index],
              );
            },
          ),
        )
      ],
    );
  }
}
