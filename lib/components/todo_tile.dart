import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../themes/light_theme.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext) deleteFunction;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
      ),
      child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                borderRadius: BorderRadius.circular(3),
              )
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            tileColor: ListTileColor.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            leading: Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: ListTileColor.checkBoxColor,
            ),
            title: Text(
              taskName,
              style: TextStyle(
                color: Theme.of(context).textTheme.displaySmall!.color,
                fontFamily: 'ClashDisplay',
                fontWeight:
                    Theme.of(context).textTheme.displaySmall!.fontWeight,
                fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          )),
    );
  }
}
