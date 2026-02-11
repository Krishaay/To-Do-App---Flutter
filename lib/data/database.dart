import 'package:hive_flutter/hive_flutter.dart' show Hive;

class TodoDatabase {
  List todoList = [];
  final myBox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ["Something idk", true],
      ["Nothing", false]
    ];
    myBox.put("TODOLIST", todoList);
  }

  void loadData() async {
    todoList = myBox.get("TODOLIST");
  }

  void updateDatabase() {
    myBox.put("TODOLIST", todoList);
  }
}