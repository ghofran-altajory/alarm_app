// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReminderData extends StatefulWidget {
  const ReminderData({super.key});

  @override
  State<ReminderData> createState() => _ReminderDataState();
}

class _ReminderDataState extends State<ReminderData> {
  TextEditingController drugcontroller = TextEditingController();
  TextEditingController revcontroller = TextEditingController();
  TextEditingController analicontroller = TextEditingController();
  TextEditingController date1controller = TextEditingController();
  TextEditingController date2controller = TextEditingController();
  TextEditingController date3controller = TextEditingController();
  TextEditingController time1controller = TextEditingController();
  TextEditingController time2controller = TextEditingController();
  TextEditingController time3controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      body: Form(
        key: formKey,
        child: SafeArea(
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
                      controller: drugcontroller,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':الوقت ',
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
                  Padding(
                    padding: const EdgeInsets.only(right: 3, left: 250),
                    child: TextFormField(
                      controller: time1controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل الوقت";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.alarm,
                          color: Color(0xFF1883DB),
                        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(': التاريخ ',
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
                  Padding(
                    padding: const EdgeInsets.only(right: 3, left: 250),
                    child: TextFormField(
                      controller: date1controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل التاريخ";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month,
                            color: Color(0xFF1883DB)),
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
                  const SizedBox(
                    height: 5,
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
                      controller: revcontroller,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':الوقت ',
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
                  Padding(
                    padding: const EdgeInsets.only(right: 3, left: 250),
                    child: TextFormField(
                      controller: time2controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل الوقت";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.alarm,
                          color: Color(0xFF1883DB),
                        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(': التاريخ ',
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
                  Padding(
                    padding: const EdgeInsets.only(right: 3, left: 250),
                    child: TextFormField(
                      controller: date2controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل التاريخ";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month,
                            color: Color(0xFF1883DB)),
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
                      controller: analicontroller,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':الوقت ',
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
                  Padding(
                    padding: const EdgeInsets.only(right: 3, left: 250),
                    child: TextFormField(
                      controller: time3controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل الوقت";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.alarm,
                          color: Color(0xFF1883DB),
                        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(': التاريخ ',
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
                  Padding(
                    padding: const EdgeInsets.only(right: 3, left: 250),
                    child: TextFormField(
                      controller: date3controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل التاريخ";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month,
                            color: Color(0xFF1883DB)),
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
                      if (formKey.currentState!.validate()) {
                        if (drugcontroller.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TabsScreen()),
                          );
                        }
                      }

                      if (revcontroller.text.isNotEmpty &&
                          date2controller.text.isNotEmpty &&
                          time2controller.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TabsScreen()),
                        );
                      }
                      if (analicontroller.text.isNotEmpty &&
                          date3controller.text.isNotEmpty &&
                          time3controller.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TabsScreen()),
                        );
                      }
                      // else {
                      //    Navigator.push(
                      //       context,
                      //        MaterialPageRoute(
                      //       builder: (context) => const TabsScreen()),
                      //       );
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
      ),
    );
  }
}
