// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/module/check_data_module.dart';
import 'package:alarm_app/screens/reminder_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckData extends StatefulWidget {
  CheckData({super.key});

  @override
  State<CheckData> createState() => _CheckDataState();
}

class _CheckDataState extends State<CheckData> {
  TextEditingController bloodPressureController = TextEditingController();
  TextEditingController diabetesController = TextEditingController();
  TextEditingController bloodtypeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController currentdrugsController = TextEditingController();
  TextEditingController vaccinesController = TextEditingController();
  TextEditingController chronicdiseaseController = TextEditingController();
  TextEditingController seriousillnessesController = TextEditingController();
  TextEditingController priorsurgeryController = TextEditingController();
  TextEditingController familyillnessController = TextEditingController();
  TextEditingController otherillnessesController = TextEditingController();
  TextEditingController allergictoController = TextEditingController();

  bool isClick = false;
  //

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
//

  // List<CheckDataModule> data = [];

//  Future<List<CheckDataModule>> getData() async {
//     var data = await firestore
//         .collection('checkData')
//         .where('user_id', isEqualTo: auth.currentUser!.uid)
//         .get();
//     return data.docs.map((e) => CheckDataModule.fromJson(e.data())).toList();
//   }

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
                      keyboardType: TextInputType.number,
                      controller: diabetesController,
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
                  Text(': السكر  ',
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
                      keyboardType: TextInputType.number,
                      controller: bloodPressureController,
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

                  Text(': ضغط الدم',
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // const SizedBox(height: 13),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: weightController,
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
                  Text(': الوزن  ',
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
                      controller: bloodtypeController,
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

                  Text(': فصيلة الدم ',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 13,
                      )),
                  // const SizedBox(height: 13),
                ],
              ),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(
                  left: 100,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 13),
                    SizedBox(
                      width: 120,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: longController,
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
                    const SizedBox(
                      width: 7,
                    ),
                    Text(': الطول',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.almarai(
                          color: const Color(0xFF000000),
                          fontSize: 13,
                        )),
                    // const SizedBox(height: 13),
                  ],
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
                controller: currentdrugsController,
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
                controller: vaccinesController,
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
                controller: chronicdiseaseController,
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
                controller: seriousillnessesController,
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
                controller: priorsurgeryController,
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
                controller: familyillnessController,
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
                controller: otherillnessesController,
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
                controller: allergictoController,
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
                          try {
                            await firestore.collection('checkData').add({
                              'user_id': auth.currentUser!.uid,
                              "diabetes": diabetesController.text,
                              "bloodPressure": bloodPressureController.text,
                              "bloodtype": bloodtypeController.text,
                              "weight": weightController.text,
                              "long": longController.text,
                              "currentDrugs": currentdrugsController.text,
                              "vaccines": vaccinesController.text,
                              "chronicDisease": chronicdiseaseController.text,
                              "seriousIllnesses":
                                  seriousillnessesController.text,
                              "priorSurgery": priorsurgeryController.text,
                              "FamilyIllness": familyillnessController.text,
                              "otherIllnesses": otherillnessesController.text,
                              "allergicTo": allergictoController.text,
                            }).then((value) {
                              // setState(() async {
                              // data = await getData();
                              // });

                              bloodPressureController.clear();
                              diabetesController.clear();
                              bloodtypeController.clear();
                              weightController.clear();
                              longController.clear();
                              currentdrugsController.clear();
                              vaccinesController.clear();
                              chronicdiseaseController.clear();
                              seriousillnessesController.clear();
                              priorsurgeryController.clear();
                              familyillnessController.clear();
                              otherillnessesController.clear();
                              allergictoController.clear();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ReminderData()),
                              );
                            });
                          } on FirebaseException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.message.toString())));

                            bloodPressureController.clear();
                            diabetesController.clear();
                            bloodtypeController.clear();
                            weightController.clear();
                            longController.clear();
                            currentdrugsController.clear();
                            vaccinesController.clear();
                            chronicdiseaseController.clear();
                            seriousillnessesController.clear();
                            priorsurgeryController.clear();
                            familyillnessController.clear();
                            otherillnessesController.clear();
                            allergictoController.clear();
                          }
                          // setState(() {});
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
