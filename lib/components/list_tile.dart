import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final String text;
  final IconData? trailingIcon;
  final Color? iconColor;
  const MyListTile(
      {super.key,
      required this.icon,
      required this.text,
      this.onTap,
      this.trailingIcon,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    final textTextStyle = TextStyle(
      fontFamily: 'ClashDisplay',
      fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
      fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
      color: Theme.of(context).textTheme.displaySmall!.color,
    );
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).textTheme.displayLarge!.color,
      ),
      title: Text(
        text,
        style: textTextStyle,
      ),
      trailing: Icon(
        trailingIcon,
        color: iconColor ?? Theme.of(context).textTheme.displayLarge!.color,
        size: 15,
      ),
    );
  }
}
