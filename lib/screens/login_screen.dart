import 'package:alarm_app/main.dart';
import 'package:alarm_app/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 252, 252, 252),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 252, 252),
        title: Text(
          'تسجيل الدخول',
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoCondensed(
            color: const Color.fromARGB(255, 24, 131, 219),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            //scrolling
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  //Image
                  //Image.asset(
                  // 'assets/pic.png',
                  // height: 150,
                  //   ),
                  const SizedBox(height: 20),
                  //Title
                  Text(
                    '!مرحبا',
                    style: GoogleFonts.robotoCondensed(
                      color: const Color.fromARGB(255, 24, 131, 219),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //sub title
                  Text(
                    'هنا بإمكانك تسجيل دخولك إذا توفر لديك حساب ',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //user name or Email
                  Text('اسم المستخدم او البريد الالكتروني',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.robotoCondensed(
                        color: Color.fromARGB(255, 24, 1, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الرجاء إدخال بريدك الإلكتروني ";
                      }

                      return null;
                    },
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      hintText: 'example@example.com',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 15, 15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 15, 15))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //password
                  Text('كلمة المرور',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.robotoCondensed(
                        color: Color.fromARGB(255, 24, 1, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الرجاء إدخال كلمة المرور";
                      }

                      return null;
                    },
                    controller: passwordcontroller,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 221, 15, 15))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 221, 15, 15))),
                        hintText: " كلمة المرور"),
                  ),

                  const SizedBox(height: 10),
                  Text('هل نسيت كلمة المرور؟',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.blue,
                        fontSize: 15,
                      )),
                  const SizedBox(height: 100),
                  //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text)
                                .then((userCredential) {
                              if (userCredential.user != null) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const ScreenRouter()),
                                    (route) => false);
                              }
                            });
                          } on FirebaseAuthException catch (e) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.message.toString())));
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.blue,
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
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => const SignupScreen()));
                        },
                        child: Text(
                          'سجل الان',
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.blue, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
