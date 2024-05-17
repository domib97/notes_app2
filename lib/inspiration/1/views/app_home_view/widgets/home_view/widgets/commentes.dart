import 'package:flutter/material.dart';

import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/arrow_up_don.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/popupBoutton.dart';

class Commentes extends StatelessWidget {
  const Commentes({
    super.key,
    required this.icon,
  });
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          ModeCubit.get(context).isDark ? const Color(0xff26252A) : Colors.cyan,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    ///  show Modal Bottom Sheet
                    showModalBottomSheet(
                      backgroundColor: ModeCubit.get(context).isDark
                          ? const Color(0xff26252A)
                          : Colors.white,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 130,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Row(
                                children: [
                                  Text(
                                    S.of(context).Confirm_chat_request,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    " @1",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const CustomButton()
                            ]),
                          ),
                        );
                      },
                    );
                  },
                  icon: icon),
              const Icon(
                Icons.location_on,
                size: 15,
              ),
              const Expanded(
                child: Row(
                  children: [
                    Text(
                      "El Shorouk City",
                    ),
                    Text(
                      " . 1min",
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: PopupButton(),
              ),
            ],
          ),
          const Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 85),
                    child: Text(
                      textAlign: TextAlign.end,
                      maxLines: 3,
                      "فيه حد ف مادنتي  ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Expanded(child: ArrowUpDon()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            textAlign: TextAlign.center,
            S.of(context).send_chat_request_button,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
