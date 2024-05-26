import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void openSignupScreen() {
    Navigator.of(context).pushReplacementNamed('signupScreen');
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text.trim(),
      password: passwordcontroller.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(223, 242, 255, 233),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            //scrolling
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image
                //Image.asset(
                // 'assets/pic.png',
                // height: 150,
                //   ),
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
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "الرجاء إدخال بريدك الإلكتروني ";
                    }

                    return null;
                  },
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 25),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 15, 15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 15, 15))),
                      hintText: "البريد الإلكتروني"),
                ),
                const SizedBox(height: 10),
                //password

                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "الرجاء إدخال كلمة المرور";
                    }

                    return null;
                  },
                  controller: passwordcontroller,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 25),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 15, 15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 15, 15))),
                      hintText: " كلمة المرور"),
                ),

                const SizedBox(height: 12),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(16),
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
                ),
                const SizedBox(
                  height: 25,
                ),
                //text: sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: openSignupScreen,
                      child: Text(
                        'سجل الان',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.green[300],
                            fontWeight: FontWeight.bold),
                      ),
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
      ),
    );
  }
}
