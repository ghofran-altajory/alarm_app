import 'dart:async';

import 'package:alarm_app/screens/admin_login.dart';
// ignore: unused_import
import 'package:alarm_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSplash extends StatefulWidget {
  const AdminSplash({super.key});

  @override
  State<AdminSplash> createState() => _AdminSplashState();
}

class _AdminSplashState extends State<AdminSplash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  AdminLogin()));
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
              "assets/Frame 1000002037.png",
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
