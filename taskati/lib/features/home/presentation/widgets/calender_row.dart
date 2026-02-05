import 'package:flutter/material.dart';

import 'day_widget.dart';

class CalenderRow extends StatelessWidget {
  const CalenderRow({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Spacer(),
        DayWidget(date: date),
        Spacer(flex: 2,),
        DayWidget(date: date.add(Duration(days: 1))),
        Spacer(flex: 2,),
        DayWidget(date:  date.add(Duration(days: 2))),
        Spacer(flex: 2,),
        DayWidget(date:  date.add(Duration(days: 3))),
        Spacer(),
      ],
    );
  }
}
