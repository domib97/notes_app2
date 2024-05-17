import 'package:flutter/material.dart';
import 'package:notes_app2/inspiration/1/generated/l10n.dart';
import 'package:notes_app2/inspiration/1/shared/styles/mode/cubit.dart';

class TextFieldComments extends StatefulWidget {
  const TextFieldComments({super.key});

  @override
  State<TextFieldComments> createState() => _TextFieldCommentsState();
}

class _TextFieldCommentsState extends State<TextFieldComments> {
  final formKey = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  bool ispass = true;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return TextFormField(
      style: const TextStyle(fontSize: 20),
      controller: user,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: S.of(context).comment_text_form_hint,
        filled: true,
        fillColor: ModeCubit.get(context).isDark
            ? const Color(0xff26252A)
            : Colors.white,
        hintMaxLines: 6,
        hintStyle: TextStyle(
          fontSize: 25,
          color: ModeCubit.get(context).isDark ? Colors.grey : Colors.black,
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: IconButton(
            iconSize: 25,
            onPressed: () {
              setState(() {
                ispass = !ispass;
              });
            },
            icon: ispass
                ? const Icon(Icons.send)
                : const Icon(
                    Icons.camera_alt,
                  ),
          ),
          color: ModeCubit.get(context).isDark ? Colors.grey : Colors.black,
        ),
      ),
    );
  }
}
