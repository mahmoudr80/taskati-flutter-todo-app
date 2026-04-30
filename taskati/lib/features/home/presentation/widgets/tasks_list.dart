import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../cubit/home_cubit.dart';
import 'dismissible_task_widget.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: BlocBuilder<HomeCubit,HomeState>(
        buildWhen: (previous, current) => current.type==EnType.task,
        builder: (BuildContext context, state) {
          final readTaskCubit = context.read<HomeCubit>();
          if(state is HomeSuccess&&state.data.tasks.isNotEmpty){
            return ListView.separated(
              itemBuilder: (context, index) {
                return DismissibleTaskWidget(
                  dismiss: (direction) {
                    if (direction ==
                        DismissDirection.endToStart) {
                      readTaskCubit.deleteTask(index);
                    } else {
                      readTaskCubit.completeTask(
                        state.data.tasks[index],
                        index,
                      );
                    }
                  },
                  task: state.data.tasks[index],
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: 8.h),
              itemCount: state.data.tasks.length,
            );
          }
          else{
            return Lottie.asset("assets/images/notFound.json");
          }

        },
      ),
    );
  }
}
