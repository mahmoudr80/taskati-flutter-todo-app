import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
 @HiveField(0)
 final String title;

 @HiveField(1)
 final String description;

 @HiveField(2)
 final String start;

 @HiveField(3)
 final String end;

 @HiveField(4)
 final String statusText;

 @HiveField(5)
 final int colorValue;

 TaskModel({required this.statusText,required this.colorValue,
  required this.title,
  required this.description,
  required this.start,
  required this.end,
 });

 TaskModel copyWith(
     {String? title, String ?description, String ?start,String ?end, String ?statusText, int ?colorValue}){
  return TaskModel(statusText: statusText??this.statusText, colorValue: colorValue??this.colorValue,
      title: title??this.title, description: description??this.description, start: start??this.start,
      end: end??this.end);
 }
}