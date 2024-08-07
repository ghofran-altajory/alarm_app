import 'package:alarm_app/screens/admin_ads.dart';
import 'package:alarm_app/screens/admin_login.dart';
import 'package:alarm_app/screens/admin_splash.dart';
import 'package:alarm_app/screens/admin_subscrib.dart';
import 'package:alarm_app/screens/archive.dart';
import 'package:alarm_app/screens/check_data.dart';
import 'package:alarm_app/screens/edit_profile_screen.dart';
import 'package:alarm_app/screens/icon_profile.dart';
import 'package:alarm_app/screens/personal_data.dart';
import 'package:alarm_app/screens/reminder_data.dart';
import 'package:alarm_app/screens/splash_screen.dart';
import 'package:alarm_app/screens/subscribe_screen.dart';

import 'package:alarm_app/screens/tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check user login status
  //final isLoggedIn = await AuthService.isUserLoggedIn();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        // providers: [
        // ChangeNotifierProvider<DarkThemeProvider>(
        //   create: (_) {
        //     return DarkThemeProvider();
        //   },
        // ),
        // ],
        // child:
        MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
            ),
            home:
                // AdminSubscrib()
                TabsScreen()
            // SubscribeScreen()
            // IconProfile(),
            // CheckData(),
            //  TabsScreen()
            // AdminSplash()
            // SplashScreen()

            // PersonalData()

            //TabsScreen()
            // AdminLogin()
            //AdminLogin()

            // ReminderData()
            // CheckData()

            // WelcomeScreen()

            //
            //SplashScreen()
            //SubscribeScreen()
            // PaymentMethod()
// CheckData()
            // ignore: prefer_const_constructors
            // home: const AdminSplash()

            );
  }
}

class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? const TabsScreen()
        : const WelcomeScreen();
  }
}
