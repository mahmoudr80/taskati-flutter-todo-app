import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../add_task/add_task_screen.dart';
import '../cubit/home_cubit.dart';
import 'add_task_button.dart';


class _CustomAddTaskWidget extends StatelessWidget {
  const _CustomAddTaskWidget({this.tapped});
final void Function()?tapped;
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return  Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat.yMMMMd().format(date).toString(),style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
            Text("Today",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        Spacer(),
        AddTaskButton(tapped: tapped,)
      ],
    );
  }
}

class AddTaskRow extends StatelessWidget {
  const AddTaskRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => current.type == EnType.task,
      listener: (context, state) {},
      child: _CustomAddTaskWidget(
        tapped: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (newTask != null) {
            await context.read<HomeCubit>().addTask(newTask);
          }
        },
      ),
    );
  }
}

