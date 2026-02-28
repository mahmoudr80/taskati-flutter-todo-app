import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/utils/utils.dart';

import '../../../auth/data/models/user_class.dart';
Future<String> getDefaultFile() async {
  final file = await assetToFile('assets/images/user.png');
  return file.path;
}
class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, required this.user, this.tapped});
  final void Function()?tapped;
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
          IconButton(
            onPressed: tapped,
            icon: CircleAvatar(
              radius: 30.r,
              backgroundImage: (user?.image != null &&
                  user!.image.isNotEmpty &&
                  File(user!.image).existsSync())
                  ? FileImage(File(user!.image))
                  : const AssetImage("assets/images/user.png")
              as ImageProvider,
            ),
          )
        ]
    );
  }
}
