
import 'package:alarm_app/screens/about_screen.dart';
import 'package:alarm_app/screens/admin_splash.dart';
import 'package:alarm_app/screens/ads_screen.dart';
import 'package:alarm_app/screens/edit_password.dart';
import 'package:alarm_app/screens/personal_data.dart';
import 'package:alarm_app/screens/setting_screen.dart';




// ignore: unused_import
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
      // ignore: prefer_const_constructors
      home: const AdminSplash()
      
      
       // PersonalData()
      // const SettingScreen()
      
      //const EditPassword(),
      
      // const AboutScreen(),
      //PersonalData(),
      //CheckData(),
      
      //const Notifications()
      //const SplashScreen(),
      //const EditProfileScreen()
      //const SubscribeScreen()
      // const ProfileScreen(),

      // const WelcomeScreen(),
      // //const SettingScreen()
      // const TabsScreen(),
    );
    // );
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
