// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_software/pages/home_page.dart';

void main() async{
  //init the hive
  await Hive.initFlutter();
  
  //open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // deactivate debug banner 
      debugShowCheckedModeBanner: false,

      // makes white screen
      home: HomePage(), 
      
      // theme: ThemeData(primarySwatch: Colors.yellow), // does not work??
    );
  }
}