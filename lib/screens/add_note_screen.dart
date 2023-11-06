// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoskido/components/primary_button.dart';
import 'package:todoskido/components/text_field.dart';

class AddNote extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  const AddNote({
    Key? key,
    this.controller,
    this.onSave,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text(
        'Add Note',
        style: TextStyle(
          fontWeight: Theme.of(context).textTheme.displayLarge!.fontWeight,
          fontFamily: 'ClashDisplay',
          color: Theme.of(context).textTheme.displayLarge!.color,
        ),
      )),
      child: SafeArea(
        child: Scaffold(
          body: CupertinoScrollbar(
            thickness: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    // Get user input
                    MyTextField(
                      controller: controller!,
                      hintText: 'Add a new task',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // buttons -> save + cancel
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // save button
                        PrimaryButton(text: 'Save', onPressed: onSave!),

                        const SizedBox(width: 8),

                        // cancel button
                        PrimaryButton(text: 'Cancel', onPressed: onCancel!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
