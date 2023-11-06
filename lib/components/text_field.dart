import 'package:flutter/material.dart';
import 'package:todoskido/themes/light_theme.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    final hintTextSyle = TextStyle(
      color: TextFieldColor.hintTextColor,
      fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
    );
    final inputTextStyle = TextStyle(
      color: TextFieldColor.inputTextColor,
      fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
    );

    return TextField(
      style: inputTextStyle,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: TextFieldColor.filledColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: TextFieldColor.filledColor)),
          fillColor: TextFieldColor.filledColor,
          filled: true,
          hintText: hintText,
          hintStyle: hintTextSyle),
    );
  }
}
