import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Archive extends StatefulWidget {
  const Archive({super.key});

  @override
  State<Archive> createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFf),
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(15),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  ': الأرشيف',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF1883DB),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]))),
    );
  }
}
