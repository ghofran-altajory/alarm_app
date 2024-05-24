import 'package:alarm_app/screens/login_screen.dart';
import 'package:alarm_app/screens/signup_screen.dart';
import 'package:alarm_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const SplashScreen(),
      routes: {
        'signupScreen': (context) => const SignupScreen(),
        'loginScreen': (context) => const LoginScreen()
//'homeScreen': 

      },
    );
  }
}
