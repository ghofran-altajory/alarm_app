import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(223, 242, 255, 233),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image
              Image.asset(
                'assets/ss.png',
                height: 150,
              ),
              const SizedBox(height: 20),
              //Title
              Text(
                'تسجيل الدخول',
                style: GoogleFonts.robotoCondensed(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
              //sub title
              Text(
                '!مرحبا بعودتك',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //user name or Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' اسم المستخدم او البريد إلكتروني ',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              //password

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      textAlign: TextAlign.right,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'كلمة المرور',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    'تسجيل الدخول',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //text: sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سجل الان',
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.green[300], fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'لا يوجد لديك حساب؟',
                    style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
