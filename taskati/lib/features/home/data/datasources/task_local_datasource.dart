
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/features/home/data/model/task_model.dart';

class TaskLocalDatasource{
late List<TaskModel>_tasks;

Future<List<TaskModel>>getTasks()async  {
return  Hive.box<TaskModel>(AppConstants.taskBoxName).values.toList();
}
Future<void> addTask(TaskModel task) async {
   await Hive.box<TaskModel>(AppConstants.taskBoxName).add(task);
}
Future<void>  deleteTask(int index) async {
  Hive.box<TaskModel>(AppConstants.taskBoxName).deleteAt(index);
}
Future<void>  completeTask(int index,TaskModel task) async {
  TaskModel newTask = task.copyWith(statusText: "Complete");
  await Hive.box<TaskModel>(AppConstants.taskBoxName).putAt(index, newTask);
}

}
