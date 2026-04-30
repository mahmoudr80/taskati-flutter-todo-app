import 'package:hive_flutter/adapters.dart';
import 'package:taskati/features/home/data/model/data_model.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/service/user_class.dart';
import '../model/task_model.dart';

class HomeLocalDatasource {
  Future<DataModel> getData() async {
    return DataModel(
       Hive.box<User>(AppConstants.userBoxName).get(AppConstants.currentUserKey)
      ??User(image: "", name:"Anonymous"),
      Hive.box<TaskModel>(AppConstants.taskBoxName).values.toList(),
    );
  }

  Future<bool> addTask(TaskModel task) async {
    try {
      await Hive.box<TaskModel>(AppConstants.taskBoxName).add(task);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTask(int index) async {
    try {
      Hive.box<TaskModel>(AppConstants.taskBoxName).deleteAt(index);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> completeTask(int index, TaskModel task) async {
    try {
      TaskModel newTask = task.copyWith(statusText: "Complete");
      await Hive.box<TaskModel>(AppConstants.taskBoxName).putAt(index, newTask);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<TaskModel>> getTasks() async {
    return Hive.box<TaskModel>(AppConstants.taskBoxName).values.toList();
  }
}
