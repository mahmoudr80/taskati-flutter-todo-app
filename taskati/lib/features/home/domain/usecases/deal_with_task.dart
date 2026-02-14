import 'package:taskati/features/home/data/datasources/tasks_local_data_source.dart';
import 'package:taskati/features/home/data/model/task_model.dart';

class DealWithTaskUseCase{
  static void createTask(TaskModel task){
    TaskDataSource.addTask(task);
  }
  static void deleteTask(int index){
    TaskDataSource.deleteTask(index);
  }

  static bool taskEmpty(){
    return TaskDataSource.box.isEmpty;
  }
}