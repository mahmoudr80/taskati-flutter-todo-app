import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_task_button.dart';


class AddTaskRow extends StatelessWidget {
  const AddTaskRow({super.key});

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
        AddTaskButton()
      ],
    );
  }
}
