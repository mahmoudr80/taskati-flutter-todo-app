part of 'task_cubit.dart';

@immutable
sealed class TaskState {
final List<TaskModel>listOfTasks;

const  TaskState({required this.listOfTasks});

}

final class TaskInitial extends TaskState {
  TaskInitial():super(listOfTasks: []);
}

final class TaskUpdate extends TaskState {
 const TaskUpdate({required super.listOfTasks});
}

final class TaskLoading extends TaskState {
  const TaskLoading({required super.listOfTasks});
}