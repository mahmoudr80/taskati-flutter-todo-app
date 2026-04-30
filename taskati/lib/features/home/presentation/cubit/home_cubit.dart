import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati/features/home/data/model/data_model.dart';
import 'package:taskati/features/home/data/repository/home_repository.dart';

import '../../data/model/task_model.dart';

part 'home_state.dart';
enum _EnSort{all,complete,toDo}
const List<String>sortList=["All","Complete","ToDo"];
enum EnType{user,task}
int currentIndex = 0;
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;
  HomeCubit(this._repository) : super(HomeLoading());

  Future<void>addTask(TaskModel task) async {
    emit(HomeLoading());
    final response=await _repository.addTask(task);
    if(response){
      final data=await _repository.getData();
      emit(HomeSuccess(data: data,type: EnType.task));
    }
    else{
      emit(HomeFailed(type: EnType.task));
    }
  }
  Future<void>loading()async{
    emit(HomeLoading());
    final data = await _repository.getData();
    emit(HomeSuccess(data: data,type: EnType.user));
  }
  Future<void>_taskSorting(_EnSort sorting)async{
    emit(HomeLoading());
    final DataModel data;
    switch(sorting){
      case _EnSort.all:
        data = await _repository.getData();
        emit(HomeSuccess(data: data,type: EnType.task));
      case _EnSort.complete:
        data = await _repository.getData();
        List<TaskModel>tasks=await _repository.getTasks();
        tasks= tasks.where((element) => element.statusText.toLowerCase()=='complete',).toList();
        emit(HomeSuccess(data: data.copyWith(newTasks:  tasks),type: EnType.task));
      case _EnSort.toDo:
        data = await _repository.getData();
        List<TaskModel>tasks=await _repository.getTasks();
        tasks= tasks.where((element) => element.statusText.toLowerCase()=='todo',).toList();
        emit(HomeSuccess(data: data.copyWith(newTasks:  tasks),type: EnType.task));
    }

  }
  sorting(int index){
    if(index==0){
      _taskSorting(_EnSort.all);
    }
    else if(index==1){
      _taskSorting(_EnSort.complete);
    }
    else{
      _taskSorting(_EnSort.toDo);
    }
  }
  Future<void>completeTask(TaskModel task,int index) async {
    final response = await _repository.completeTask(index, task);
    if(response){
      final data =await _repository.getData();
      emit(HomeSuccess(data: data,type: EnType.task));
    }
    else{
      emit(HomeFailed(type: EnType.task));
    }
  }

  Future<void>deleteTask(int index) async {
    final response=await _repository.deleteTask(index);
    if(response){
      final data =await _repository.getData();
      emit(HomeSuccess(data: data,type: EnType.task));
    }else{
      emit(HomeFailed(type: EnType.task));
    }

  }

  Future<void> getUser() async {
    final data = await _repository.getData();
    emit(HomeSuccess(data: data,type: EnType.user));
  }
}
