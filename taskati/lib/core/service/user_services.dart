import 'package:hive/hive.dart';
import 'package:taskati/core/service/user_class.dart';

import '../constants/app_constants.dart';
import '../utils/utils.dart';

abstract class UserServices {
  static Box<User> get _userBox => Hive.box<User>(AppConstants.userBoxName);

  static Future<User> getUser() async {
    final file = await assetToFile('assets/images/user.png');
    return _userBox.get(AppConstants.currentUserKey) ??
        User(image: file.path, name: 'Anonymous');
  }

  static Future<void> createUser(User user) async {
    await _userBox.put(AppConstants.currentUserKey, user);
  }

  static Future<void> deleteUser() async {
    _userBox.delete(AppConstants.currentUserKey);
  }

  static Future<void> updateUser(User user) async {
    await createUser(user);
  }
}
