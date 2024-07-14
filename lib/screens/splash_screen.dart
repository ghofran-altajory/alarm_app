import 'dart:async';

import 'package:alarm_app/main.dart';
// ignore: unused_import
import 'package:alarm_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ScreenRouter()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1883DB),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/alarm2logo.png",
            ),
            const SizedBox(height: 20),
            Text(
              'منبه لذوي كبار السن والاحتياجات الخاصة',
              style: GoogleFonts.almarai(
                fontSize: 16,
                color: const Color(0xFFffffff),
              ),
            ),
          ],
        )));
  }
}
