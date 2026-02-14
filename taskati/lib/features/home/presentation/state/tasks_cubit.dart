import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati/features/home/data/datasources/tasks_local_data_source.dart';

import '../../data/model/task_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial(TaskDataSource.getTasks()));

void delete(int index){
  TaskDataSource.deleteTask(index);
  emit(UpdateTaskState(TaskDataSource.getTasks()));
}
  void addTask(){
    emit(UpdateTaskState(TaskDataSource.getTasks()));
  }
}
