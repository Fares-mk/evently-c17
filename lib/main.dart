import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17/core/remote/local/memory_manager.dart';
import 'package:evently_c17/core/resources/AppTheme.dart';
import 'package:evently_c17/providers/theme_porvider.dart';
import 'package:evently_c17/providers/user_provider.dart';
import 'package:evently_c17/ui/add_event/screen/add_event_screen.dart';
import 'package:evently_c17/ui/details_event/screen/details_screen.dart';
import 'package:evently_c17/ui/edit_event/screen/edit_event.dart';
import 'package:evently_c17/ui/forget_pass/screen/forgetpas_screen.dart';
import 'package:evently_c17/ui/home/screen/home_screen.dart';
import 'package:evently_c17/ui/home/tabs/home_tab/home_tab.dart';
import 'package:evently_c17/ui/onboarding/screen/onboarding_screen.dart';
import 'package:evently_c17/ui/signin/screen/signin_screen.dart';
import 'package:evently_c17/ui/signup/screen/signup_screen.dart';
import 'package:evently_c17/ui/splash/screen/splash_screen.dart';
import 'package:evently_c17/ui/start/screen/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await MemoryManager.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemePorvider()..initTheme(),
      child: EasyLocalization(
        supportedLocales: [Locale("en"), Locale("ar")],
        path: 'assets/transations',
        fallbackLocale: Locale("en"),
        startLocale: Locale("ar"),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemePorvider provider = Provider.of<ThemePorvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.mode,
      debugShowCheckedModeBanner: false,
      routes: {
        EditEvent.routeName:(_)=>EditEvent(),
        SplashScreen.routeName: (_) => SplashScreen(),
        StartScreen.routeName: (_) => StartScreen(),
        SigninScreen.routeName: (_) => SigninScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        ForgetpassScreen.routeName: (_) => ForgetpassScreen(),
        HomeScreen.routeName: (_) => ChangeNotifierProvider(
          create: (BuildContext context) => UserProvider(),
          child: HomeScreen(),
        ),
        AddEventScreen.routeName: (_) => AddEventScreen(),
        OnboardingScreen.routeName: (_) => OnboardingScreen(),
        DetailsScreen.routeName:(_)=>DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
