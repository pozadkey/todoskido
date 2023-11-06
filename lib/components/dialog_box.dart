import 'package:flutter/material.dart';
import 'package:todoskido/components/primary_button.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // save button
                    Text('New Task')
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
                  height: 30,
                ),
                // buttons -> save + cancel
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // save button
                    PrimaryButton(text: 'Save', onPressed: onSave),

                    const SizedBox(width: 8),

                    // cancel button
                    PrimaryButton(text: 'Cancel', onPressed: onCancel),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
