import 'package:hive_flutter/hive_flutter.dart';

part 'user_class.g.dart';

@HiveType(typeId:0)
class User {
  @HiveField(0)
  String image;
  @HiveField(1)
  String name;
  User({required this.image,required this.name});
}