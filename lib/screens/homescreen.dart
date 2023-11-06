import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoskido/components/todo_tile.dart';
import 'package:todoskido/themes/light_theme.dart';

import '../components/dialog_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();

  List toDoList = [
    ['New note', false],
    ['New note', false]
  ];

// Mark checkBox
  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_textController.text, false]);
    });
    Navigator.of(context).pop();
  }

  // Create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _textController,
              maxLines: 16,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
    _textController.clear();
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = TextStyle(
      fontWeight: Theme.of(context).textTheme.displayLarge!.fontWeight,
      fontFamily: 'ClashDisplay',
      color: Theme.of(context).textTheme.displayLarge!.color,
    );
    return Scaffold(
        body: CupertinoPageScaffold(
            backgroundColor:
                Theme.of(context).cupertinoOverrideTheme?.barBackgroundColor,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                CupertinoSliverNavigationBar(
                  heroTag: 'List',
                  largeTitle: Text(' My List', style: headerTextStyle),
                  automaticallyImplyLeading: false,
                )
              ],
              body: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: toDoList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ToDoTile(
                    taskName: toDoList[index][0],
                    taskCompleted: toDoList[index][1],
                    onChanged: (value) => checkBoxChange(value, index),
                    deleteFunction: (context) => deleteTask(index),
                  );
                },
              ),
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ListTileColor.checkBoxColor,
          onPressed: createNewTask,
          child: const Icon(
            Icons.add,
            size: 50,
            color: Colors.white, // Set the icon color
          ),
        ));
  }
}
