import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/features/home/data/model/task_model.dart';
import 'package:taskati/features/home/presentation/widgets/task_widget.dart';

class DismissibleTaskWidget extends StatelessWidget {
  const DismissibleTaskWidget({super.key, required this.dismiss, this.task});
  final void Function(DismissDirection)? dismiss;
  final TaskModel? task;
  @override
  Widget build(BuildContext context) {
  return  Dismissible(
      key: UniqueKey(),
      onDismissed: dismiss,

      background: Container(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 80.w,
          margin: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16.r),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 28.r,
          ),
        ),
      ),

      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        child: Container(
          width: 80.w,
          margin: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16.r),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 28.r,
          ),
        ),
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: TaskWidget(task: task!),
      ),
    );
  }
}
