import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/theme/theme_cubit.dart';
import 'package:taskati/todo_app.dart';

import 'core/constants/app_constants.dart';
import 'core/service/user_class.dart';
import 'features/home/data/model/task_model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<User>(AppConstants.userBoxName);
  await Hive.openBox<TaskModel>(AppConstants.taskBoxName);
  runApp(BlocProvider(create: (_) =>ThemeCubit() ,child:  TodoApp(),));
}
