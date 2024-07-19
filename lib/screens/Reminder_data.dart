import 'package:alarm_app/screens/home_screen.dart';
import 'package:alarm_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReminderData extends StatefulWidget {
  const ReminderData({super.key});

  @override
  State<ReminderData> createState() => _ReminderDataState();
}

class _ReminderDataState extends State<ReminderData> {
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
          ' بيانات التذكير',
          textAlign: TextAlign.center,
          style: GoogleFonts.almarai(
            color: const Color(0xFF1883DB),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(' : الادوية',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.only(right: 3, left: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(':المراجعات المستقبلية ',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.only(right: 3, left: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                Text(':تحاليل ',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.only(right: 3, left: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TabsScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 62, vertical: 15),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1883DB),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        'التالي ',
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
    );
  }
}
