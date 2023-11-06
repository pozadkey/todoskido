import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final Icon? trailing;
  final String text;
  final IconButton? trailingIcon;
  final Color? iconColor;
  const MyListTile(
      {super.key,
      required this.icon,
      required this.text,
      this.onTap,
      this.trailingIcon,
      this.iconColor,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    final textTextStyle = TextStyle(
      fontFamily: 'ClashDisplay',
      fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
      fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
      color: Theme.of(context).textTheme.displaySmall!.color,
    );
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).textTheme.displayLarge!.color,
      ),
      title: Text(
        text,
        style: textTextStyle,
      ),
      trailing: IconButton(
        icon: trailing!,
        color: iconColor ?? Theme.of(context).textTheme.displayLarge!.color,
        iconSize: 20,
        onPressed: onTap,
      ),
    );
  }
}
