import 'package:hive/hive.dart';

class SkidoDb {
  // Use box
  final _skidoBox = Hive.box('skidobox');

  // Create list
  List toDoList = [];

  //  Display data when  launching app for the first time
  void launchData() {
    toDoList = [
      ['New task', false]
    ];
  }

  // Load the data from database
  void loadData() {
    toDoList = _skidoBox.get('SKIDOLIST');
  }

  // Update the database
  void updateDataBase() {
    _skidoBox.put('SKIDOLIST', toDoList);
  }
}
