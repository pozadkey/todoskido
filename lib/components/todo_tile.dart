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
        left: 20,
        right: 20,
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: ListTileColor.bgColor,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: ListTileColor.checkBoxColor),

              // Task name
              Text(
                taskName,
                style: TextStyle(
                  fontFamily: 'ClashDisplay',
                  fontWeight:
                      Theme.of(context).textTheme.displaySmall!.fontWeight,
                  fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
