import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/core/service/user_services.dart';
import 'package:taskati/features/auth/presentation/login_screen.dart';
import 'package:taskati/features/home/data/datasources/home_local_datasource.dart';
import 'package:taskati/features/home/data/repository/home_repository.dart';
import 'package:taskati/features/home/presentation/cubit/home_cubit.dart';
import 'package:taskati/features/home/presentation/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/service/user_class.dart';
import '../home/data/model/task_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    final userBox = Hive.box<User>(AppConstants.userBoxName);

    if (userBox.isEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create:(_){
                final cubit = HomeCubit(HomeRepository(HomeLocalDatasource()));
                cubit.loading();
                return cubit;
            }  ,
            child: const HomeScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/images/checklist.json"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Taskati", style: TextStyle(fontSize: 30.sp)),
            ],
          ),
          Text(
            "It's Time To Get Organized",
            style: TextStyle(color: Colors.grey, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}
