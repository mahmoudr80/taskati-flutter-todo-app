import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/features/auth/domain/user_class.dart';
import 'package:taskati/todo_app.dart';

void main()async {
  await Hive.initFlutter();
   Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>(AppConstants.userBoxName);
  runApp(const TodoApp());
}
