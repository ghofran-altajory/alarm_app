import 'package:alarm_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
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
              Navigator.of(context).pop(WelcomeScreen);
            },
          ),
        ),
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: Text(
          ' الأسعار',
          textAlign: TextAlign.center,
          style: GoogleFonts.almarai(
            color: const Color(0xFF1883DB),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                Container(
                  height: 130,
                  width: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0x70C5E4FE),
                  ),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 115, vertical: 30),
                        child: Column(
                          children: [
                            Text(
                              "منفرد",
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  // textAlign: TextAlign.start,
                
                                  'د.ل ',
                                  style: GoogleFonts.almarai(
                                    color: const Color.fromARGB(255, 24, 1, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  // textAlign: TextAlign.start,
                
                                  ' 5.00',
                                  style: GoogleFonts.almarai(
                                    color: const Color.fromARGB(255, 24, 1, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                  )
                  
                
                ),
                const SizedBox(height: 10),
                  Container(
                  height: 130,
                  width: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0x70C5E4FE),
                  ),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 115, vertical: 30),
                        child: Column(
                          children: [
                            Text(
                              "منفرد",
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  // textAlign: TextAlign.start,
                
                                  'د.ل ',
                                  style: GoogleFonts.almarai(
                                    color: const Color.fromARGB(255, 24, 1, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  // textAlign: TextAlign.start,
                
                                  ' 5.00',
                                  style: GoogleFonts.almarai(
                                    color: const Color.fromARGB(255, 24, 1, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                  )
                  
                
                ),
                  const SizedBox(height: 10),
                  Container(
                  height: 130,
                  width: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0x70C5E4FE),
                  ),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 115, vertical: 30),
                        child: Column(
                          children: [
                            Text(
                              "منفرد",
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  // textAlign: TextAlign.start,
                
                                  'د.ل ',
                                  style: GoogleFonts.almarai(
                                    color: const Color.fromARGB(255, 24, 1, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  // textAlign: TextAlign.start,
                
                                  ' 5.00',
                                  style: GoogleFonts.almarai(
                                    color: const Color.fromARGB(255, 24, 1, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                  )
                  
                
                ),
                  const SizedBox(height: 10),
                  Container(
                  height: 130,
                  width: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0x70C5E4FE),
                  ),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 115, vertical: 30),
                        child: Column(
                          children: [
                            Text(
                              "منفرد",
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  // textAlign: TextAlign.start,
                
                                  'د.ل ',
                                  style: GoogleFonts.almarai(
                                    color: const Color.fromARGB(255, 24, 1, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  // textAlign: TextAlign.start,
                
                                  ' 5.00',
                                  style: GoogleFonts.almarai(
                                    color: const Color.fromARGB(255, 24, 1, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                  )
                  
                
                ),
                  const SizedBox(height: 10),
                  Container(
                  height: 130,
                  width: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0x70C5E4FE),
                  ),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 115, vertical: 30),
                        child: Column(
                          children: [
                            Text(
                              "منفرد",
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          
              ],
            ),
            
          ),
        ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
