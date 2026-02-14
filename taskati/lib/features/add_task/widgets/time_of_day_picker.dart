
import 'package:flutter/material.dart';

Future<TimeOfDay?> pickTime(BuildContext context)async{
  DateTime date = DateTime.now();
  final TimeOfDay ? time=await showTimePicker(context: context,
     initialTime:TimeOfDay(hour:date.hour, minute:date.minute));
 return time;
   }
