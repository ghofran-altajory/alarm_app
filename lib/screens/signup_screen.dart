// ignore_for_file: unused_import

import 'package:alarm_app/main.dart';
import 'package:alarm_app/screens/login_screen.dart';
import 'package:alarm_app/screens/personal_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final _hasFocus = ValueNotifier<bool>(false);
  bool isClick = false;
  bool isShow = true;
  bool isShow2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFf),
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: Text(
          'حساب جديد',
          textAlign: TextAlign.center,
          style: GoogleFonts.almarai(
            color: const Color(0xFF1883DB),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            //scrolling
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  //user name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':اسم المستخدم',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.almarai(
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  TextFormField(
                    onChanged: (text) {
                      if (_hasFocus.value) {
                        _hasFocus.value = false;
                      }
                    },
                    onTap: () {
                      _hasFocus.value = true;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "!الرجاء إدخال اسم المستخدم ";
                      }

                      return null;
                    },
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      hintText: 'اسم المستخدم',
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(' :البريد الالكتروني',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.almarai(
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  TextFormField(
                    onChanged: (text) {
                      if (_hasFocus.value) {
                        _hasFocus.value = false;
                      }
                    },
                    onTap: () {
                      _hasFocus.value = true;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "!الرجاء إدخال بريدك الإلكتروني ";
                      }

                      return null;
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'example@example.com',
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  //password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':كلمة المرور',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  TextFormField(
                    obscureText: isShow,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "!الرجاء إدخال كلمة المرور";
                      }

                      return null;
                    },
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      hintText: '**********',
                      suffixIcon: IconButton(
                        icon: Icon(
                            !isShow ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                            // isShow?
                            // isShow=false
                            // :
                            // isShow = true;
                          });
                        },
                      ),
                      hintStyle: const TextStyle(fontSize: 16),
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),

                  const SizedBox(height: 25),
                  //confim password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':تأكيد كلمة المرور',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  TextFormField(
                    obscureText: isShow2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "!الرجاء تأكيد كلمة المرور";
                      }

                      if (value != passwordcontroller.text) {
                        return "!كلمات المرور غير متطابقة";
                      }

                      return null;
                    },
                    controller: confirmpasswordcontroller,
                    decoration: InputDecoration(
                      hintText: '**********',
                      suffixIcon: IconButton(
                        icon: Icon(
                            !isShow2 ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isShow2 = !isShow2;
                            // isShow?
                            // isShow=false
                            // :
                            // isShow = true;
                          });
                        },
                      ),
                      hintStyle: const TextStyle(fontSize: 16),
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),

                  const SizedBox(height: 80),
                  //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: isClick
                        ? GestureDetector(
                            child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                                color: const Color(0xFF1883DB),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: Color(0xFFFCFCFf),
                            )),
                          ))
                        : GestureDetector(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  setState(() {
                                    isClick = true;
                                  });
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text)
                                      .then((userCredential) {
                                    if (userCredential.user != null) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  PersonalData()),
                                          (route) => false);
                                    }
                                  });
                                } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    isClick = false;
                                  });
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(e.message.toString())));
                                }
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: const Color(0xFF1883DB),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                'إنشاء حساب',
                                style: GoogleFonts.almarai(
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
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          'سجل دخولك',
                          style: GoogleFonts.almarai(
                              fontSize: 12,
                              color: const Color(0xFF1883DB),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'هل لديك حساب؟',
                        style: GoogleFonts.almarai(fontWeight: FontWeight.bold),
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
