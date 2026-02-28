import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taskati/features/home/data/model/task_model.dart';
import 'package:taskati/features/home/data/repository/task_repository.dart';

import '../../data/datasources/task_local_datasource.dart';

part 'task_state.dart';

enum EnSort{all,complete,toDo}

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository _repo =TaskRepository(TaskLocalDatasource());
  TaskCubit() : super(TaskInitial());

 addTask(TaskModel task) async {
  _repo.addTask(task);
  emit(TaskUpdate(listOfTasks:await _repo.getTasks()));
}
taskLoading(EnSort sorting)async{
   switch(sorting){
     case EnSort.all:
       emit(TaskLoading(listOfTasks: await _repo.getTasks()));
     case EnSort.complete:
       var list = await _repo.getTasks();
      list= list.where((element) => element.statusText.toLowerCase()=='complete',).toList();
       emit(TaskLoading(listOfTasks: list));
     case EnSort.toDo:
       var list = await _repo.getTasks();
       list= list.where((element) => element.statusText.toLowerCase()=='todo',).toList();
       emit(TaskLoading(listOfTasks: list));

   }

}
completeTask(TaskModel task,int index) async {
  await _repo.completeTask(index, task);
  emit(TaskUpdate(listOfTasks: await _repo.getTasks()));
}
  deleteTask(int index) async {
    await _repo.deleteTask(index);
    emit(TaskUpdate(listOfTasks: await _repo.getTasks()));
  }

  sorting(int index){
   if(index==0){
     taskLoading(EnSort.all);
   }
   else if(index==1){
     taskLoading(EnSort.complete);
   }
   else{
     taskLoading(EnSort.toDo);
   }
  }
}
