import 'package:chat_app/utils/textfield_styles.dart';
import 'package:flutter/material.dart';

class LoginTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final bool hideText;

  const LoginTextfield(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.hideText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: 400,
        child: TextFormField(
          validator: (value) {
            return validator(value);
          },
          controller: controller,
          obscureText: hideText,
          decoration: InputDecoration(
              hintStyle: ThemeTextStyle.loginTextFieldStyle,
              hintText: hintText,
              border: ThemeTextStyle.loginBorderFieldStyle),
        ),
      ),
    );
  }
}
