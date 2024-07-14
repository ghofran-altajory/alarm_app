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
  bool isClick = false;
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFf),
      appBar: AppBar(
        leading: IconTheme(
          data: const IconThemeData(
            color: Color(0xFF1883DB),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: Text(
          'تسجيل الدخول',
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
                  //Image
                  //Image.asset(
                  // 'assets/pic.png',
                  // height: 150,
                  //   ),
                  const SizedBox(height: 20),
                  //Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              textAlign: TextAlign.end,
                              '! مرحبا',
                              style: GoogleFonts.almarai(
                                color: const Color(0xFF1883DB),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'هنا بإمكانك تسجيل دخولك إذا توفر لديك حساب ',
                              style: GoogleFonts.almarai(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                          ]), //
                    ],
                  ),
                  //sub title

                  const SizedBox(
                    height: 50,
                  ),
                  //user name or Email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':اسم المستخدم او البريد الالكتروني',
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
                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('هل نسيت كلمة المرور؟',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.almarai(
                                color: const Color(0xFF1883DB),
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
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
                  ),
                  const SizedBox(
                    height: 12,
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
                        'لا يوجد لديك حساب؟',
                        style: GoogleFonts.almarai(
                            fontSize: 12, fontWeight: FontWeight.bold),
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
