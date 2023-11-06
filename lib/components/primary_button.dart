// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';

import '../themes/light_theme.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color? bgColor;

  const PrimaryButton({Key? key, required this.text, required this.onPressed, this.bgColor})
      : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    final buttonFont = TextStyle(
        fontSize: 16,
        color: PrimaryButtonColors.textColor,
        fontFamily: 'ClashDisplay',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3);

    return TextButton(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Text(
          widget.text,
          style: buttonFont,
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
      style: TextButton.styleFrom(
        backgroundColor: widget.bgColor ?? PrimaryButtonColors.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            1.0,
          ),
        ),
      ),
    );
  }
}
