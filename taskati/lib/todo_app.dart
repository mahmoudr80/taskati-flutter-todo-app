import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:taskati/features/home/presentation/home_screen.dart';
import 'package:taskati/features/splash/splash_screen.dart';
import 'package:taskati/features/update_profile/update_profile_screen.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'features/home/presentation/cubit/task_cubit.dart';
import 'features/home/presentation/cubit/user_cubit.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<ThemeCubit,ThemeMode>(
          builder: (context, mode) {
            return MaterialApp(
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: mode,
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          },
        ));
  }
}

//lottifiles