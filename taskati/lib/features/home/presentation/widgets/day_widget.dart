import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({super.key, required this.date});
  final DateTime date ;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10.r),
      child: Column(
        children: [
          Text(DateFormat.MMM().format(date).toString(),style: Theme.of(context).textTheme.bodyMedium,),
          Text(DateFormat.d().format(date).toString(),style: Theme.of(context).textTheme.headlineMedium,),
          Text(DateFormat.E().format(date).toString(),style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
