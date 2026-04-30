import 'package:taskati/features/home/data/datasources/home_local_datasource.dart';

import '../model/data_model.dart';
import '../model/task_model.dart';

class HomeRepository {
  final HomeLocalDatasource _localDatasource;

  HomeRepository(this._localDatasource);
  Future<DataModel> getData()async{
  return  await  _localDatasource.getData();
  }
  Future<List<TaskModel>>getTasks()async  {
    return await  _localDatasource.getTasks();
  }
  Future<bool> addTask(TaskModel task) async {
    return await _localDatasource.addTask(task);
  }
  Future<bool>  deleteTask(int index) async {
    return _localDatasource.deleteTask(index);
  }
  Future<bool>  completeTask(int index,TaskModel task) async {
    return await _localDatasource.completeTask(index, task);
  }

}