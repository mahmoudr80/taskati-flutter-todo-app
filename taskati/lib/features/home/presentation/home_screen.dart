import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/features/home/presentation/widgets/add_task_row.dart';
import 'package:taskati/features/home/presentation/widgets/calender_row.dart';
import 'package:taskati/features/home/presentation/widgets/home_appbar.dart';
import 'package:taskati/features/home/presentation/widgets/sort_widget.dart';
import 'package:taskati/features/home/presentation/widgets/tasks_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
            HomeAppBar(),
              SizedBox(height: 15.h),
              AddTaskRow(),
              SizedBox(height: 15.h),
              CalenderRow(),
              SortWidget(),
              SizedBox(height: 10.h),
              TasksList(),
            ],
          ),
        ),
      ),
    );
  }
}
