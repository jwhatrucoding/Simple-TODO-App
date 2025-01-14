
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_software/data/database.dart';
import 'package:todo_software/pages/util/dialog_box.dart';
import 'package:todo_software/pages/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState(){
    //if this is the first time ever opening the app, then create default data
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    } else {
      //there already exists data
      db.loadData();
    }

    super.initState();
  }
  // variables
  //text controller
  final _controller = TextEditingController();

  //method
  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1] ;
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false,]);
      _controller.clear();
    });
    //close current window
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
    db.updateDataBase();
  }

  // delete task
  void deleteTask(int index, ) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  //UI
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[200],     
      appBar: AppBar(
        title: Text("TO DO"),
        backgroundColor: Colors.yellow[400],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      )

    );
  }
}
