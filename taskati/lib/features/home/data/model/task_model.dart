import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
 @HiveField(0)
 final String title;

 @HiveField(1)
 final String description;

 @HiveField(2)
 final String start;

 @HiveField(3)
 final String end;

 @HiveField(4)
 final String statusText;

 @HiveField(5)
 final Color color;

 TaskModel({required this.statusText,required this.color,
  required this.title,
  required this.description,
  required this.start,
  required this.end,
 });
}

List<TaskModel> listOfTasks=[
 TaskModel(statusText: "ToDo", color: Colors.indigo, title: "Task1", description:"I will do this task",
     start: "2:20", end: "3:30"),
 TaskModel(statusText: "ToDo", color: Colors.redAccent, title: "Task2", description:"I will do this task",
     start: "4:20", end: "5:10"),
 TaskModel(statusText: "ToDo", color: Colors.blueAccent, title: "Task3", description:"I will do this task",
     start: "5:20", end: "6:10"),
 TaskModel(statusText: "ToDo", color: Colors.green, title: "Task4", description:"I will do this task",
     start: "6:20", end: "7:30"),
];
