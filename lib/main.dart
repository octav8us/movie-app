import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/bloc/movies_bloc.dart';
import 'package:movies_app/core/dependency_injection/get_it.dart';

import 'core/theme/custom_app_theme.dart';
import 'view/screens/home_screen.dart';

void main() {
  setupGetIt();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return BlocProvider(
          create: (context) => MoviesBloc(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: CustomAppTheme(),
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
