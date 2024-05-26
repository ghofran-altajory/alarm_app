import 'package:alarm_app/auth.dart';
import 'package:alarm_app/screens/home_screen.dart';
import 'package:alarm_app/screens/login_screen.dart';
import 'package:alarm_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
// ربط مع firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      //home: const SplashScreen(),
      // home: const Auth(),
      routes: {
        '/': (context) => const Auth(),
        'signupScreen': (context) => const SignupScreen(),
        'loginScreen': (context) => const LoginScreen(),
        'homeScreen': (context) => const HomeScreen(),
      },
    );
  }
}
