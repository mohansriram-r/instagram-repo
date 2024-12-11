import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    super.key,
    required this.controller,
    required this.text,
    this.ispass = false,
  });

  final TextEditingController controller;
  final String text;
  final bool ispass;

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      obscureText: ispass,
      keyboardType: ispass ? TextInputType.text : TextInputType.emailAddress,
    );
  }
}
