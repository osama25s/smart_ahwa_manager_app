import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          title: 'Smart Ahwa Manager',
          theme: ThemeData(primarySwatch: Colors.brown),
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
