import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/features/auth/data/models/user_class.dart';
import 'package:taskati/features/home/data/model/task_model.dart';
import 'package:taskati/features/home/presentation/widgets/add_task_row.dart';
import 'package:taskati/features/home/presentation/widgets/calender_row.dart';
import 'package:taskati/features/home/presentation/widgets/home_appbar.dart';
import 'package:taskati/features/home/presentation/widgets/task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = Hive.box<User>(AppConstants.userBoxName).getAt(0);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children:[
              HomeAppbar(user: userData),
              SizedBox(height: 15.h,),
              AddTaskRow(),
              SizedBox(height: 15.h,),
              CalenderRow(),
              SizedBox(height: 10.h,),
              Expanded(
                child: ListView.separated(itemBuilder: (context, index) {
                  return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration:BoxDecoration(
                        color: Colors.green,

                      ),
                          child: Align(
                              alignment: AlignmentGeometry.centerLeft,
                              child: Icon(Icons.add,size: 35.r,color: Colors.white,))),
                      secondaryBackground:Container(
                          padding: EdgeInsets.all(10.r),
                          decoration:BoxDecoration(
                          color: Colors.red,

                      ),child: Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: Icon(Icons.delete,size: 35.r,color: Colors.white,))),
                      child: TaskWidget(task: listOfTasks[index],));
                }, separatorBuilder: (context, index) => SizedBox(height: 8.h,),
                    itemCount: listOfTasks.length),
              )


            ]
          ),
        ),
      ),
    );
  }
}
