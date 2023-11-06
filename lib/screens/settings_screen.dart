// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, curly_braces_in_flow_control_structures, avoid_returning_null_for_void, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/list_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final textTextStyle = TextStyle(fontSize: 15, letterSpacing: -0.24);

  void goToProfilePage() {
    // Pop drawer
    //  Navigator.pop(context);

    //   // Go to profile page
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const ProfileView()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = TextStyle(
      fontWeight: Theme.of(context).textTheme.displayLarge!.fontWeight,
      fontFamily: 'ClashDisplay',
      color: Theme.of(context).textTheme.displayLarge!.color,
    );
    return CupertinoPageScaffold(
      backgroundColor:
          Theme.of(context).cupertinoOverrideTheme?.barBackgroundColor,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CupertinoSliverNavigationBar(
            heroTag: 'settings',
            largeTitle: Text(' Settings', style: headerTextStyle),
            automaticallyImplyLeading: false,
          )
        ],
        body: CupertinoScrollbar(
          thickness: 2,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  MyListTile(
                    icon: Icons.color_lens,
                    text: 'Appearance',
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MyListTile(
                    icon: Icons.shield,
                    text: 'Privacy Policy',
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
