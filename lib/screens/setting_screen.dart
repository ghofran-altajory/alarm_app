import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../module/profi_list_title.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

int i = 1;

class _SettingScreenState extends State<SettingScreen> {
  List<ProfiListTitlModule> data = [
    const ProfiListTitlModule(title: "ضبط كلمة المرور", icon: Icons.key),
    const ProfiListTitlModule(title: "حذف الحساب", icon: Icons.person),
  ];
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
                    onTap: () {},
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
