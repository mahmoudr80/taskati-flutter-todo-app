import 'package:taskati/features/home/data/datasources/task_local_datasource.dart';

import '../model/task_model.dart';

class TaskRepository{
 final TaskLocalDatasource _localDatasource;

  TaskRepository(this._localDatasource);

 Future<List<TaskModel>>getTasks()async  {
   return await  _localDatasource.getTasks();
 }
 Future<void> addTask(TaskModel task) async {
 return await _localDatasource.addTask(task);
 }
 Future<void>  deleteTask(int index) async {
  return _localDatasource.deleteTask(index);
 }
 Future<void>  completeTask(int index,TaskModel task) async {
   return await _localDatasource.completeTask(index, task);
 }

}