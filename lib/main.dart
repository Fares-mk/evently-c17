import 'package:evently_c17/core/resources/AppTheme.dart';
import 'package:evently_c17/ui/add_event/screen/add_event_screen.dart';
import 'package:evently_c17/ui/forget_pass/screen/forgetpas_screen.dart';
import 'package:evently_c17/ui/forget_pass/screen/forgetpas_screen.dart';
import 'package:evently_c17/ui/home/screen/home_screen.dart';
import 'package:evently_c17/ui/signin/screen/signin_screen.dart';
import 'package:evently_c17/ui/signup/screen/signup_screen.dart';
import 'package:evently_c17/ui/splash/screen/splash_screen.dart';
import 'package:evently_c17/ui/start/screen/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        StartScreen.routeName:(_)=>StartScreen(),
        SigninScreen.routeName:(_)=>SigninScreen(),
        SignupScreen.routeName:(_)=>SignupScreen(),
        ForgetpassScreen.routeName:(_)=>ForgetpassScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        AddEventScreen.routeName:(_)=>AddEventScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

