part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {

  final List<TaskModel>listOfTasks;

 const TasksState(this.listOfTasks);
}

final class TasksInitial extends TasksState {
 const TasksInitial(super.listOfTasks);

}
final class UpdateTaskState extends TasksState {
  const UpdateTaskState(super.listOfTasks);
}
