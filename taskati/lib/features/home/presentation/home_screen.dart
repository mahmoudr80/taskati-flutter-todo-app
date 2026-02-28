import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/features/add_task/add_task_screen.dart';
import 'package:taskati/features/home/presentation/cubit/user_cubit.dart';
import 'package:taskati/features/home/presentation/widgets/add_task_row.dart';
import 'package:taskati/features/home/presentation/widgets/calender_row.dart';
import 'package:taskati/features/home/presentation/widgets/dismissible_task_widget.dart';
import 'package:taskati/features/home/presentation/widgets/home_appbar.dart';
import 'package:taskati/features/home/presentation/widgets/sort_widget.dart';
import 'package:taskati/features/update_profile/update_profile_screen.dart';

import 'cubit/task_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<String>sortList=['All','Complete','ToDo'];
    int currentIndex=0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
              children: [
                BlocBuilder<UserCubit, UserState>(
                  builder: (BuildContext context, state) {
                   final readUserCubit = context.read<UserCubit>();
                    return HomeAppbar(user: state.currentUser, tapped: () async {
                      await Navigator.push(context, MaterialPageRoute(
                        builder: (context) => UpdateProfileScreen(),));
                      readUserCubit.update();
                    },);
                  },
                ),
                SizedBox(height: 15.h,),
                AddTaskRow(tapped: () async {
                  final newTask = await Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => AddTaskScreen(),));
                  if(newTask!=null){context.read<TaskCubit>().addTask(newTask);
                  }
                },),
                SizedBox(height: 15.h,),
                CalenderRow(),
                BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 40.h,
                      child: ListView.separated(itemBuilder:(context, index) {
                        return  currentIndex==index?SortWidget(title: sortList[index],backColor: Colors.indigo,forColor: Colors.white,
                          tapped: () {
                            currentIndex = index;
                            context.read<TaskCubit>().sorting(currentIndex);
                          },)
                            :SortWidget(title: sortList[index],tapped: () {
                          currentIndex = index;
                          context.read<TaskCubit>().sorting(currentIndex);
                        },);
                      },
                        separatorBuilder: (context, index) => SizedBox(width: 7.w,),
                        itemCount:sortList.length,scrollDirection: Axis.horizontal,),
                    );
                  },
                ),
                SizedBox(height: 10.h,),
                BlocBuilder<TaskCubit, TaskState>(
                  builder: (BuildContext context, state) {
                  final  readTaskCubit = context.read<TaskCubit>();
                    return Expanded(
                      child: state.listOfTasks.isEmpty ?
                      Lottie.asset("assets/images/notFound.json")
                          : ListView.separated(itemBuilder: (context, index) {
                        return DismissibleTaskWidget(dismiss: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            readTaskCubit.deleteTask(index);
                          } else {
                            readTaskCubit.completeTask(
                                state.listOfTasks[index], index);
                          }
                        }, task: state.listOfTasks[index],
                        );
                      },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 8.h,),
                          itemCount: state.listOfTasks.length),
                    );
                  },
                )
              ]
          ),
        ),
      ),
    );
  }
}

