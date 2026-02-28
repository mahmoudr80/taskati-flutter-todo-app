
import 'dart:io';

import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/constants/app_constants.dart';

import '../../features/auth/data/models/user_class.dart';
import '../utils/utils.dart';

class UserService{
  Box<User>  get _userBox =>Hive.box<User>(AppConstants.userBoxName);

  Future<User>getUser() async {
    final file =await  assetToFile('assets/images/user.png');
    return _userBox.get(AppConstants.currentUserKey)??User(image:file.path, name:'Anonymous');
  }

  Future<void> createUser(User user) async {
    await _userBox.put(AppConstants.currentUserKey, user);
  }
  Future<void>  deleteUser() async {
    _userBox.delete(AppConstants.currentUserKey);
  }
  Future<void> updateUser(User user) async {
    await createUser(user);
  }

}
