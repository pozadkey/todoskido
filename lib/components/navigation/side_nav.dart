import 'package:flutter/material.dart';
import 'package:todoskido/responsive/responsive.dart';
import 'package:todoskido/screens/homescreen.dart';
import 'package:todoskido/screens/settings_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sideNavIndexProvider = StateProvider<int>((ref) => 0);

class SideNav extends ConsumerWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: NavigationRail(
                selectedIconTheme: IconThemeData(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                    size: 25),
                selectedLabelTextStyle: TextStyle(
                  fontFamily: 'ClashDisplay',
                  color: Theme.of(context).textTheme.displayLarge!.color,
                ),
                unselectedLabelTextStyle: TextStyle(
                  fontFamily: 'ClashDisplay',
                  color: Colors.grey[400],
                ),
                labelType: NavigationRailLabelType.all,
                unselectedIconTheme:
                    IconThemeData(color: Colors.grey[400], size: 25),
                selectedIndex: ref.watch(
                    sideNavIndexProvider), // Access the state using .state
                onDestinationSelected: (index) {
                  ref.read(sideNavIndexProvider.notifier).state =
                      index; // Update the state using .state
                },
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home_rounded),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings_rounded),
                    label: Text('Settings'),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.grey[300],
            ),
            Expanded(
                child: Responsive(
                    child: _tabPages(ref.watch(sideNavIndexProvider)))),
            VerticalDivider(
              color: Colors.grey[300],
            ),
            Expanded(
              child: Container(
                color: Theme.of(context)
                    .cupertinoOverrideTheme
                    ?.barBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabPages(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SettingsScreen();
      default:
        return const HomeScreen();
    }
  }
}
