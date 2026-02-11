import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/addtask.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/todo.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    super.initState();
    
    if(myBox.get("TODOLIST") == null) {
      db.createInitialData();
    }
    else {
      db.loadData();
    }
  }

  // checkbox click
  void checkboxChanged(bool? val, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  //controller
  final cntrlr = TextEditingController();

  //saving a task
  void saveTask() {
    setState(() {
      db.todoList.add([cntrlr.text, false]);
      cntrlr.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // create new task
  void createTask() {
    showDialog(context: context, builder: (context) {
      return AddTask(
        controller: cntrlr,
        onSave: saveTask,
        onCancel:() => Navigator.of(context).pop(),
      );
    },
   );
   db.updateDatabase();
  }

  // delete a task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 244, 234, 1),
      
      appBar: AppBar(
        title: Center(child: Text("TO DO LIST", style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),)),
        backgroundColor: Color.fromRGBO(126, 172, 181, 1),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        backgroundColor: Color.fromRGBO(191, 70, 70, 1),
        child: Icon(Icons.add, color: Colors.white,),
        ),

      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0], 
            taskDone: db.todoList[index][1], 
            onChanged:(value) => checkboxChanged(value, index),
            deleteFunction: (context) => deleteTask(index), 
            );
        },
      ),
    );
  }
}