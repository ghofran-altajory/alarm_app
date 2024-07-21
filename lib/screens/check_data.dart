// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/screens/reminder_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckData extends StatefulWidget {
  CheckData({super.key});

  @override
  State<CheckData> createState() => _CheckDataState();
}

class _CheckDataState extends State<CheckData> {
  TextEditingController acontroller = TextEditingController();
  TextEditingController bcontroller = TextEditingController();
  TextEditingController ccontroller = TextEditingController();
  TextEditingController dcontroller = TextEditingController();
  TextEditingController econtroller = TextEditingController();
  TextEditingController fcontroller = TextEditingController();
  TextEditingController gcontroller = TextEditingController();
  TextEditingController hcontroller = TextEditingController();
  TextEditingController icontroller = TextEditingController();
  TextEditingController jcontroller = TextEditingController();
  TextEditingController kcontroller = TextEditingController();
  TextEditingController lcontroller = TextEditingController();
  TextEditingController mcontroller = TextEditingController();
  TextEditingController ncontroller = TextEditingController();
  TextEditingController ocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: Text(
          ' بيانات التشخيص',
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
              Text(' :المعدلات الحيوية',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // const SizedBox(height: 13),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: acontroller,
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
                  Text(': ضغط الدم ',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 13,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: bcontroller,
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

                  Text(': السكر',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 13,
                      )),
                  // const SizedBox(height: 13),
                ],
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(': فصيلة الدم ',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF000000),
                            fontSize: 13,
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 250),
                child: TextFormField(
                  controller: ccontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                      Text(':الوزن',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF000000),
                            fontSize: 13,
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 250),
                child: TextFormField(
                  controller: dcontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
              Text(':الطول ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF000000),
                    fontSize: 13,
                  )),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 250),
                child: TextFormField(
                  controller: econtroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                height: 30,
              ),
              Text('الادوية',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(': الادوية الحالية ',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF000000),
                            fontSize: 13,
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 13),
              TextFormField(
                controller: fcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 13),
              Text(': التطعيمات  ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF000000),
                    fontSize: 13,
                  )),
              const SizedBox(height: 13),
              TextFormField(
                controller: gcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(' :الامراض',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text(': الامراض المزمنة ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF000000),
                    fontSize: 13,
                  )),
              const SizedBox(height: 13),
              TextFormField(
                controller: hcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(':الامراض الخطيرة ',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF000000),
                            fontSize: 13,
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 13),
              TextFormField(
                controller: icontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 13),
              Text(':الجراحات السابقة ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF000000),
                    fontSize: 13,
                  )),
              const SizedBox(height: 13),
              TextFormField(
                controller: jcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 13),
              Text(':امراض العائلة  ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF000000),
                    fontSize: 13,
                  )),
              const SizedBox(height: 13),
              TextFormField(
                controller: kcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 13),
              Text(':امراض اخرى  ',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF000000),
                    fontSize: 13,
                  )),
              const SizedBox(height: 13),
              TextFormField(
                controller: lcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(' : الحساسية(دواء_طعام)',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text(': حساسية من',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF000000),
                    fontSize: 13,
                  )),
              const SizedBox(height: 13),
              TextFormField(
                controller: mcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(' :الصور',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text(':صور اشعة',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF000000),
                    fontSize: 13,
                  )),
              const SizedBox(height: 13),
              TextFormField(
                controller: ncontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(':صور تحاليل',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF000000),
                    fontSize: 13,
                  )),
              const SizedBox(height: 13),
              TextFormField(
                controller: ocontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0x70C5E4FE),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReminderData()),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 62, vertical: 15),
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
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
