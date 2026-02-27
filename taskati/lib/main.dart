import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/core/service/user_service.dart';
import 'package:taskati/core/theme/theme_cubit.dart';
import 'package:taskati/features/auth/data/models/user_class.dart';
import 'package:taskati/features/home/data/model/task_model.dart';
import 'package:taskati/todo_app.dart';

final UserService userService = UserService();
void main()async {
  await Hive.initFlutter();
   Hive.registerAdapter(UserAdapter());
   Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<User>(AppConstants.userBoxName);
  await Hive.openBox<TaskModel>(AppConstants.taskBoxName);
  runApp(BlocProvider(create: (_) =>ThemeCubit() ,child:  TodoApp(),));
}
