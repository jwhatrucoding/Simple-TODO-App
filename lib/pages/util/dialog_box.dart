// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_software/pages/util/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
VoidCallback onSave;
VoidCallback onCancel;


  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });
  
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",                
              ),
            ),

            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [              
                //save button
                MyButtons(text: "Save", onPressed: onSave,),

                //space between buttons
                const SizedBox(width: 8),

                //cancel button
                MyButtons(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    ); 
  }
}