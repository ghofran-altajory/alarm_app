import 'package:alarm_app/screens/admin_control_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLogin extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController adminemailcontroller = TextEditingController();
  TextEditingController adminpasswordcontroller = TextEditingController();
  bool isClick = false;
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    controller: adminemailcontroller,
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
                    controller: adminpasswordcontroller,
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
                          )
                          )
                        : GestureDetector(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  setState(() {
                                    isClick = true;
                                  });

                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: adminemailcontroller.text,
                                          password:
                                              adminpasswordcontroller.text)
                                      .then((userCredential) {
                                    if (userCredential.user != null) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                   AdminControlPage()),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
