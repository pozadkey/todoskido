import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/list_tile.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
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
            largeTitle: Text('Settings', style: headerTextStyle),
            automaticallyImplyLeading: false,
          )
        ],
        body: CupertinoScrollbar(
          thickness: 2,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  MyListTile(
                    icon: Icons.color_lens,
                    text: 'Appearance',
                    onTap: () {
                      ref.read(themeModeProvider.notifier).state =
                          themeMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    },
                    trailing: Icon(themeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode),
                  ),
                  const SizedBox(height: 5),
                  Divider(color: Colors.grey[400]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
