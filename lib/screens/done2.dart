import 'dart:async';

import 'package:alarm_app/screens/personal_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Done2 extends StatefulWidget {
  const Done2({super.key});

  @override
  State<Done2> createState() => _Done2State();
}

class _Done2State extends State<Done2> {
   void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const PersonalData()));
    });
    super.initState();
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(

backgroundColor: const Color(0xFF1883DB),
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xFFFFFFFF),
                child: Icon(
                  Icons.done,
                  size: 90,
                ),
                // child: IconButton(
                //     onPressed: () {},
                //     icon: const Center(
                //       child: Icon(
                //         size: 30,
                //         Icons.person,
                //       ),
                //     )),
              ),
              const SizedBox(height: 20),
              Text(
                'تمت العملية بنجاح',
                style: GoogleFonts.almarai(
                  fontSize: 45,
                  color: const Color(0xFFffffff),
                ),
              ),
            ],
          )),
        ));


    
  }
}