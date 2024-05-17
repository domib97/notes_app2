import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../shared/styles/mode/cubit.dart';

class PopupButton extends StatelessWidget {
  const PopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: ModeCubit.get(context).isDark
          ? const Color(0xff26252A)
          : Colors.white,
      icon: Icon(
        Icons.more_horiz,
        size: 35,
        color: ModeCubit.get(context).isDark
            ? Colors.white
            : const Color(
                0xff26252A,
              ),
      ),
      offset: const Offset(0, 40),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () async {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ModeCubit.get(context).isDark
                    ? const Color(0xff26252A)
                    : Colors.white,
                content: Text(S.of(context).delete,
                    style: TextStyle(
                      color: ModeCubit.get(context).isDark
                          ? Colors.white
                          : const Color(
                              0xff26252A,
                            ),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
              ),
            );
          },
          child: Row(
            children: [
              ///////////
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete),
              ),

              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(S.of(context).delete),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () async {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ModeCubit.get(context).isDark
                    ? const Color(0xff26252A)
                    : Colors.white,
                content: Text(S.of(context).boost,
                    style: TextStyle(
                      color: ModeCubit.get(context).isDark
                          ? Colors.white
                          : const Color(
                              0xff26252A,
                            ),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
              ),
            );
          },
          child: Row(
            children: [
              ///////////
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.rocket_launch),
              ),

              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(S.of(context).boost),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
