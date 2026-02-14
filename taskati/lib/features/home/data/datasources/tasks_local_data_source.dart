

import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/features/home/data/model/task_model.dart';


class TaskDataSource{
static  Box<TaskModel> box=Hive.box(AppConstants.taskBoxName);

static  List<TaskModel>getTasks(){
    return box.values.toList();
  }
  static void addTask(TaskModel task){
  box.add(task);
  }
static void deleteTask(int index){
  box.deleteAt(index);
}
}
