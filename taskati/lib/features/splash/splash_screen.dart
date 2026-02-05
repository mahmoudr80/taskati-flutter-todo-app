

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/features/auth/data/models/user_class.dart';
import 'package:taskati/features/auth/presentation/login_screen.dart';
import 'package:taskati/features/home/presentation/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user = Hive.box<User>(AppConstants.userBoxName);
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      if(user.isEmpty){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));

      }

    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/images/checklist.json"),
          Text("Taskati",style: TextStyle(fontSize: 30.sp),),
          Text("It's Time To Get Organized",style: TextStyle(color: Colors.grey,fontSize: 15.sp),),
        ],
      )
    );
  }
}
