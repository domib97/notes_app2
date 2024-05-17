import 'package:flutter/material.dart';
import 'package:notes_app2/inspiration/1/views/create_tweet/create_tweet_view.dart';

class floatingHomeButtom extends StatelessWidget {
  const floatingHomeButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 60,
        width: 60,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: () {
                Navigator.pushNamed(context, CreateTweetView.pageID);
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
