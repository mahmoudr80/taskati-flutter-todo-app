import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/data/models/user_class.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, required this.user});
final User? user;
  @override
  Widget build(BuildContext context) {
    return   Row(mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("Hello, ${user?.name??"Anonymous"}",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),),
                Text("Have a nice day",style: Theme.of(context).textTheme.titleLarge,),
              ]
          ),
          Spacer(),
          CircleAvatar(
            radius: 30.r,
            backgroundImage:Image.file(File(user?.image??"")).image,
          )
        ]
    );
  }
}
