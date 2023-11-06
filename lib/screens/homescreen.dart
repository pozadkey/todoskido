import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoskido/components/todo_tile.dart';
import 'package:todoskido/data/db.dart';
import 'package:todoskido/themes/light_theme.dart';
import '../components/dialog_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // If launching app for first time, create this data
    if (_skidobox.get('SKIDOLIST') == null) {
      db.launchData();
    } else {
      // Load if there's existing  data
      db.loadData();
    }
    super.initState();
  }

  // Use the box
  final _skidobox = Hive.box('skidobox');
  SkidoDb db = SkidoDb();

  final _textController = TextEditingController();

// Mark checkBox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      // Store the item that needs to be moved
      final changedItem = db.toDoList[index];

      // Remove the item from its current position
      db.toDoList.removeAt(index);

      // Add the item to the end of the list with the updated checkbox value
      changedItem[1] = !changedItem[1];
      db.toDoList.add(changedItem);
    });

    db.updateDataBase();
  }

  // Save new task
  void saveNewTask() {
    final newTask = [_textController.text, false];

    // Check if there are marked tasks and place them at the top
    final markedTasks = db.toDoList.where((task) => task[1] == true).toList();
    final unmarkedTasks =
        db.toDoList.where((task) => task[1] == false).toList();

    // Add the new task to the top of the unmarked tasks
    final updatedToDoList = [newTask, ...unmarkedTasks, ...markedTasks];

    setState(() {
      db.toDoList = updatedToDoList;
      _textController.clear();
    });

    Navigator.of(context).pop();
    db.updateDataBase();
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
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
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
                body: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemCount: db.toDoList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ToDoTile(
                      taskName: db.toDoList[index][0],
                      taskCompleted: db.toDoList[index][1],
                      onChanged: (value) => checkBoxChanged(value, index),
                      deleteFunction: (context) => deleteTask(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                        color: Colors.grey[
                            400]); // You can customize the separator here.
                  },
                ))),
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
