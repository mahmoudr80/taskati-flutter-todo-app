
import 'package:flutter/material.dart';

  Future<DateTime?>pickDate(BuildContext context)async{
    DateTime date = DateTime.now();
   final DateTime?picked=await showDatePicker(firstDate: date,
      lastDate:DateTime(date.year+1),
      initialDate:date, context: context,
      builder: (BuildContext  context,Widget? child) {
        return Theme(data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.indigo,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.deepPurple,  // Buttons text color
            ),
          ),
        ),
            child: child!);
      },
    );
   return picked;

   }
