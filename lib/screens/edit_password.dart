import 'package:alarm_app/screens/tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  bool isClick = false;
  bool isShow = true;
  bool isShow2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ' ضبط كلمة المرور ',
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
                          icon: Icon(!isShow
                              ? Icons.visibility
                              : Icons.visibility_off),
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
                          icon: Icon(!isShow2
                              ? Icons.visibility
                              : Icons.visibility_off),
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
                    SizedBox(
                      height: 80,
                    ),
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
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                        email: 'ayafaraj20@gmail.com')
                                    .then((_) {
                                  Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const TabsScreen()),
                                  );
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF1883DB),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text(
                                  ' تحديث كلمة المرور',
                                  style: GoogleFonts.almarai(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                )),
                              ),
                            ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
