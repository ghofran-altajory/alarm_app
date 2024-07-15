import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

int i = 1;

class _ProfileScreenState extends State<ProfileScreen> {
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
            ' الملف الشخصي',
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
              itemCount: 1,
              itemBuilder: (context, i) {
                return ListTile(
                    onTap: () {
                      // Navigator.pushAndRemoveUntil(
                      // context,
                      // CupertinoPageRoute(
                      // builder: (context) => const WelcomeScreen()),
                      //(route) => false);
                    },
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: const Color(0xFF1883DB),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    title: Text(
                      ' تعديل الملف الشخصي',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.almarai(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(
                      (Icons.person),
                      color: Color(0xFF1883DB),
                    ));
                    
              }),
              
        )));
  }
}
