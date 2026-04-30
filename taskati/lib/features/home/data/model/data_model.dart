import 'package:taskati/features/home/data/model/task_model.dart';

import '../../../../core/service/user_class.dart';

class DataModel {
  final User user;
  final List<TaskModel> tasks;

  const DataModel(this.user, this.tasks);

  DataModel copyWith({User? newUser, List<TaskModel>? newTasks}) {
    return DataModel(newUser ?? user, newTasks ?? tasks);
  }
}
