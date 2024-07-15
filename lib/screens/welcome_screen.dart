import 'package:alarm_app/screens/about_screen.dart';
import 'package:alarm_app/screens/login_screen.dart';
import 'package:alarm_app/screens/subscribe_screen.dart';
// ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(60),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/alarm logo@3x.png',
                      width: 100, height: 100),
                  const SizedBox(height: 20),
                  Text(
                    'منبه لذوي كبار السن والإحتياجات الخاصة',
                    style: GoogleFonts.almarai(
                      fontSize: 16,
                      color: const Color(0xFF1883DB),
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1883DB),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        'تسجيل الدخول',
                        style: GoogleFonts.almarai(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SubscribeScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: const Color(0xFFECF1FF),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        ' الاشتراك',
                        style: GoogleFonts.almarai(
                          color: const Color(0xFF1883DB),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //تشيلني لصفحه حول
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => const AboutScreen()));
                        },
                        child: Text(
                          'حول',
                          style: GoogleFonts.almarai(
                              fontSize: 20,
                              color: const Color(0xFF1883DB),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Image.asset('assets/Vector2.png', width: 40, height: 40),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
