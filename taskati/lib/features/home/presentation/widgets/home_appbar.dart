import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/utils/utils.dart';
import '../../../../core/service/user_class.dart';
import '../../../update_profile/update_profile_screen.dart';
import '../cubit/home_cubit.dart';
Future<String> _getDefaultFile() async {
  final file = await assetToFile('assets/images/user.png');
  return file.path;
}
class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key,  this.user, this.tapped});
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

class  HomeAppBar extends StatelessWidget {
  const  HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<HomeCubit, HomeState>(
     // buildWhen: (previous, current) => current.type == EnType.user,
      builder: (BuildContext context, state) {
        final readCubit = context.read<HomeCubit>();
        if (state is HomeSuccess) {
          return _CustomAppBar(
            user: state.data.user,
            tapped: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateProfileScreen(),
                ),
              );
              await readCubit.getUser();
            },
          );
        } else {
          return _CustomAppBar(
            tapped: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateProfileScreen(),
                ),
              );
              await readCubit.getUser();
            },
          );
        }
      },
    );
  }
}
