import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/features/home/data/model/task_model.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});
final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(borderRadius: BorderRadiusGeometry.circular(12.r)
          ,color: Color(task.colorValue)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5.h,
              children: [
                Text(task.title,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
                Text("${task.start} | ${task.end}",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
                Text(task.description,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
              ],
            ),
          ),
          Container(
            width: 0.5,
            height: kToolbarHeight*1.3,
            decoration: BoxDecoration(color: Colors.white),
          ),
          SizedBox(width: 5.w,),
          RotatedBox(quarterTurns: 3,child:
            Text("ToDO",style:  Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),)
        ],
      ),
    );
  }
}
