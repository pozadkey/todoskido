import 'package:flutter/material.dart';
import 'package:todoskido/components/primary_button.dart';
import 'package:todoskido/responsive/responsive.dart';

import '../themes/light_theme.dart';
import 'text_field.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final int? maxLines;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: AlertDialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: AlertBoxColors.bgColor,
          content: SizedBox(
            height: 480,
            width: 800,
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // save button
                      Text(
                        'New Task',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Get user input
                  MyTextField(
                    controller: controller,
                    maxLines: maxLines,
                    hintText: 'Add a new task...',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // buttons -> save + cancel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // save button
                      PrimaryButton(
                        text: 'Save',
                        onPressed: onSave,
                        bgColor: const Color.fromARGB(255, 33, 129, 208),
                      ),
    
                      const SizedBox(width: 12),
    
                      // cancel button
                      PrimaryButton(text: 'Cancel', onPressed: onCancel),
                    ],
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
