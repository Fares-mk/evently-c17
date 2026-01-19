import 'package:evently_c17/ui/start/screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/resources/AssetsManager.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AssetsManager.logo))
          .animate(
        onComplete: (controller){
          Navigator.pushReplacementNamed(context, StartScreen.routeName);
        },
      )
          .slideX(duration: Duration(seconds: 1))
          .then()
          .scale(duration: Duration(seconds: 1), begin: Offset(0.5, 0.5)),
    );
  }
}
