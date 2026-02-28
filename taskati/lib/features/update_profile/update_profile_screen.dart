import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/core/theme/theme_cubit.dart';
import 'package:taskati/core/utils/utils.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/auth/data/models/user_class.dart';
import 'package:taskati/features/update_profile/cubit/user_cubit.dart';
import 'package:taskati/features/update_profile/widgets/image_bottom_sheet.dart';
import 'package:taskati/features/update_profile/widgets/rename_buttom_sheet.dart';
import 'package:taskati/main.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => UserCubit()..userLoading(),
  child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.indigo,size: 30.r),
        actions: [IconButton(icon: Icon(Icons.light_mode_outlined),
        onPressed: () {
          context.read<ThemeCubit>().toggleTheme();
        },)],
      ),
      body:
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          spacing: 10.h,
          children: [
            Spacer(),
            Stack(
              children: [
                BlocBuilder<UserCubit,UserState>(
  builder: (context, state) {
    return IconButton(onPressed:() async {
      final image =  await imageBottomSheet(context);
      final user =await userService.getUser();
      user.image=image!.path;
      context.read<UserCubit>().userUpdate(user);

    },
        icon:CircleAvatar(radius: 50.r,backgroundImage:state.currentUser==null?
        Image.asset('assets/images/user.png' ,).image
            :Image.file( File(state.currentUser!.image)).image
                    )
                );
  },
),
                Positioned(
                  bottom: 0.r, right: 0.r,
                    child: BlocBuilder<UserCubit, UserState>(
  builder: (context, state) {
    return IconButton(onPressed:() async {
                    final image =  await imageBottomSheet(context);
                    final user =await userService.getUser();
                    user.image=image!.path;
                    context.read<UserCubit>().userUpdate(user);
                      },icon: Icon(Icons.camera_alt,color: Colors.indigo,));
  },
))],),
            Divider(),
            Row(
              children: [
                Expanded(child: BlocBuilder<UserCubit, UserState>(
  builder: (context, state) {
    return Text( state.currentUser==null? 'Anonymous': state.currentUser!.name,style: TextStyle(color: Colors.indigo,fontSize: 20.sp),);
  },
)),
          BlocBuilder<UserCubit, UserState>(
  builder: (context, state) {
    return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r),
                      border: BoxBorder.all(color: Colors.indigo)),
                  child: IconButton(onPressed: () async {
                 final newName =await renameBottomSheet(context,state.currentUser!.name);
                 final user =await userService.getUser();
                 user.name=newName;
                 context.read<UserCubit>().userUpdate(user);
                  }
                      ,icon:Icon(Icons.edit,color: Colors.indigo,size: 25.r,)),
                );},)],),
            Spacer(),
          ],
        ),),),);}}
