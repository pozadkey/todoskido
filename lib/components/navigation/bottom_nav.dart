import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoskido/screens/homescreen.dart';
import 'package:todoskido/screens/settings_screen.dart';

// Navigation provider
var indexProvider = StateProvider<int>((ref) => 0);

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key});

  final navFontTextStyle =
      const TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: IndexedStack(
          index: ref.watch(indexProvider),
          children: const [HomeScreen(), SettingsScreen()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              Theme.of(context).cupertinoOverrideTheme?.barBackgroundColor,
          onTap: (index) {
            ref.read(indexProvider.notifier).state = index;
          },
          currentIndex: ref.watch(indexProvider),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).textTheme.displayLarge!.color,
          unselectedItemColor: Colors.grey[400],
          selectedFontSize: 10,
          unselectedFontSize: 9,
          showUnselectedLabels: true,
          selectedLabelStyle: navFontTextStyle,
          unselectedLabelStyle: navFontTextStyle,
          elevation: 0,
          iconSize: 30,
          items: const [
            // Home icon
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
            // Settings icon
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded), label: ''),
          ],
        ));
  }
}
