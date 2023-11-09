// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoskido/components/navigation/bottom_nav.dart';
import 'package:todoskido/components/navigation/side_nav.dart';

class ScreenType extends StatefulWidget {
  const ScreenType({Key? key}) : super(key: key);

  @override
  State<ScreenType> createState() => _ScreenTypeState();
}

class _ScreenTypeState extends State<ScreenType> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (width <= 760) {
        return BottomNav();
      } else {
        return SideNav();
      }
    });
  }
}
