// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,  
    required this.deleteFunction,
  });
  
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top:25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white, //ToDo: white does not work. Why?
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              
              //taskname
              Text(
                taskName,
                // make a line through done todos
                style: TextStyle(
                  decoration: taskCompleted 
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}