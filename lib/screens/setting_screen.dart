// ignore: unused_import
import 'package:alarm_app/screens/edit_password.dart';
import 'package:alarm_app/screens/tabs_screen.dart';
import 'package:alarm_app/main.dart';
import 'package:alarm_app/module/profi_list_title.dart';
import 'package:alarm_app/screens/edit_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../module/profi_list_title.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

int i = 1;

class _SettingScreenState extends State<SettingScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<ProfiListTitlModule> data = [
    ProfiListTitlModule(
        title: "ضبط كلمة المرور", icon: Icons.key, onTap: () {}),
    ProfiListTitlModule(title: "حذف الحساب", icon: Icons.person, onTap: () {})
  ];

  @override
  Widget build(BuildContext context) {
    List<ProfiListTitlModule> data = [
      ProfiListTitlModule(
        title: "ضبط كلمة المرور",
        icon: Icons.key,
        onTap: () {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const EditPassword()));
        },
      ),
      ProfiListTitlModule(
        title: "حذف الحساب",
        icon: Icons.person,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Align(
                      alignment: Alignment.center,
                      child: Text(" هل تريد حذف الحساب نهائيا ؟",
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF1883DB),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))),
                  content: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: const Color(0x70C5E4FE),
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Text(
                                    'إلغاء',
                                    style: GoogleFonts.almarai(
                                      color: const Color(0xFF1883DB),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () async {
                                  // await FirebaseAuth.instance
                                  //     .()
                                  //     .then((_) {
                                  //   Navigator.pushReplacement(
                                  //     context,
                                  //     CupertinoPageRoute(
                                  //         builder: (context) =>
                                  //             const ScreenRouter()),
                                  //   );
                                  // });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF1883DB),
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Text(
                                    'نعم, متأكد',
                                    style: GoogleFonts.almarai(
                                      color: const Color(0xFFECF1FF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      ProfiListTitlModule(
        title: "تسجيل الخروج",
        icon: Icons.logout,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Align(
                      alignment: Alignment.center,
                      child: Text(" هل تريد تسجيل الخروج؟ ",
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF1883DB),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))),
                  content: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: const Color(0x70C5E4FE),
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Text(
                                    'إلغاء',
                                    style: GoogleFonts.almarai(
                                      color: const Color(0xFF1883DB),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () async {
                                  await FirebaseAuth.instance
                                      .signOut()
                                      .then((_) {
                                    Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const ScreenRouter()),
                                    );
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF1883DB),
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Text(
                                    'نعم, متأكد',
                                    style: GoogleFonts.almarai(
                                      color: const Color(0xFFECF1FF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    ];
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
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const TabsScreen()));
              },
            ),
          ),
          toolbarHeight: kToolbarHeight,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 252, 252, 252),
          title: Text(
            ' الإعدادات',
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
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: data[index].onTap,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: const Color(0xFF1883DB),
                      onPressed: () {},
                    ),
                    title: Text(
                      data[index].title.toString(),
                      textAlign: TextAlign.right,
                      style: GoogleFonts.almarai(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      (data[index].icon),
                      color: const Color(0xFF1883DB),
                    ));
              }),
        )));
  }
}
