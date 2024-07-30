import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../module/check_data_module.dart';

class IconProfile extends StatefulWidget {
  const IconProfile({super.key});

  @override
  State<IconProfile> createState() => _IconProfileState();
}

class _IconProfileState extends State<IconProfile> {
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
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // /////

  List<CheckDataModule> data = [];

  Future<List<CheckDataModule>> getData() async {
    var data = await firestore
        .collection('checkData')
        .where('user_id', isEqualTo: auth.currentUser!.uid)
        .get();
    return data.docs.map((e) => CheckDataModule.fromJson(e.data())).toList();
  }
  

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
        body: FutureBuilder<List<CheckDataModule>>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  backgroundColor: const Color(0xFF1883DB),
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                data = snapshot.data ?? [];

                return data.isEmpty
                    ? Center(child: Image.asset("assets/Untitled design.png"))
                    : SafeArea(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // const SizedBox(height: 13),
                                    SizedBox(
                                      width: 120,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: diabetesController,
                                        decoration: InputDecoration(
                                          hintText: data.first.diabetes,
                                          filled: true,
                                          fillColor: const Color(0x70C5E4FE),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 4),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue)),
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
                                          hintText: data.first.bloodPressure,
                                          filled: true,
                                          fillColor: const Color(0x70C5E4FE),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 4),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // const SizedBox(height: 13),
                                    SizedBox(
                                      width: 120,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: weightController,
                                        decoration: InputDecoration(
                                          hintText: data.first.weight,
                                          filled: true,
                                          fillColor: const Color(0x70C5E4FE),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 4),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue)),
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
                                          hintText: data.first.bloodtype,
                                          filled: true,
                                          fillColor: const Color(0x70C5E4FE),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 4),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // const SizedBox(height: 13),
                                      SizedBox(
                                        width: 120,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: longController,
                                          decoration: InputDecoration(
                                            hintText: data.first.long,
                                            filled: true,
                                            fillColor: const Color(0x70C5E4FE),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 4),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                    hintText: data.first.currentdrugs,
                                    filled: true,
                                    fillColor: const Color(0x70C5E4FE),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                                    hintText: data.first.vaccines,
                                    filled: true,
                                    fillColor: const Color(0x70C5E4FE),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                                    hintText: data.first.chronicdisease,
                                    filled: true,
                                    fillColor: const Color(0x70C5E4FE),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                  ),
                                ),
                                const SizedBox(height: 13),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                    hintText: data.first.seriousillnesses,
                                    filled: true,
                                    fillColor: const Color(0x70C5E4FE),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                                    hintText: data.first.priorsurgery,
                                    filled: true,
                                    fillColor: const Color(0x70C5E4FE),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                                    hintText: data.first.familyillness,
                                    filled: true,
                                    fillColor: const Color(0x70C5E4FE),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                                    hintText: data.first.otherillnesses,
                                    filled: true,
                                    fillColor: const Color(0x70C5E4FE),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                                    hintText: data.first.allergicto,
                                    filled: true,
                                    fillColor: const Color(0x70C5E4FE),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: GestureDetector(
                                    onTap: () async {
                                      try {
                                        setState(() {
                                          isClick = true;
                                        });

                                        // getFavorites(coinId);
                                        var deletable = await firestore
                                            .collection('checkData')
                                            .where("user_id",
                                                isEqualTo:
                                                    auth.currentUser!.uid)
                                            .where("diabetes",
                                                isEqualTo: data.first.diabetes)
                                            .where("bloodPressure",
                                                isEqualTo:
                                                    data.first.bloodPressure)
                                            .where("bloodtype",
                                                isEqualTo: data.first.bloodtype)
                                            .where("weight",
                                                isEqualTo: data.first.weight)
                                            .where("long",
                                                isEqualTo: data.first.long)
                                            .where("current drugs",
                                                isEqualTo:
                                                    data.first.currentdrugs)
                                            .where("vaccines",
                                                isEqualTo: data.first.vaccines)
                                            .where("chronic disease",
                                                isEqualTo:
                                                    data.first.chronicdisease)
                                            .where("serious illnesses",
                                                isEqualTo:
                                                    data.first.seriousillnesses)
                                            .where("prior surgery",
                                                isEqualTo:
                                                    data.first.priorsurgery)
                                            .where("Family Illness",
                                                isEqualTo:
                                                    data.first.familyillness)
                                            .where("other illnesses",
                                                isEqualTo:
                                                    data.first.otherillnesses)
                                            .where("allergic to",
                                                isEqualTo:
                                                    data.first.allergicto)
                                           
                                            .get();

                                        firestore
                                            .collection('checkData')
                                            .doc(deletable.docs.first.id
                                                .toString())
                                            .update({
                                          "diabetes": diabetesController.text,
                                          "bloodPressure ":
                                              bloodPressureController.text,
                                          "bloodtype": bloodtypeController.text,
                                          "weight ": weightController.text,
                                          "long": longController.text,
                                          "current drugs":
                                              currentdrugsController.text,
                                          "vaccines": vaccinesController.text,
                                          "chronic disease":
                                              chronicdiseaseController.text,
                                          " serious illnesses":
                                              seriousillnessesController.text,
                                          "prior surgery":
                                              priorsurgeryController.text,
                                          "Family Illness":
                                              familyillnessController.text,
                                          "other illnesses":
                                              otherillnessesController.text,
                                          "allergic to":
                                              allergictoController.text,
                                         
                                          // "name": namecontroller.text,
                                          // "phone": phonecontroller.text,
                                        }

                                                // );

                                                // await firestore
                                                //     .collection('personal_data')
                                                //     .add({
                                                //   'user_id': auth.currentUser!.uid,
                                                //   "name": namecontroller.text,
                                                //   "phone": phonecontroller.text,
                                                //   "familyPhone": "",
                                                //   "gender": data.first.gender.toString()
                                                // }
                                                ).then((value) {
                                          // setState(() async {
                                          //   data = await getData();
                                          // });
                                          setState(() {});
                                          // namecontroller.clear();
                                          // phonecontroller.clear();
                                        });
                                      } on FirebaseException catch (e) {
                                        setState(() {
                                          isClick = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    e.message.toString())));
                                        // phonecontroller.clear();
                                        diabetesController.clear();
                                        bloodPressureController.clear();
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
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => const ReminderData()),
                                      // );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 62, vertical: 15),
                                      child: Container(
                                        padding: const EdgeInsets.all(18),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF1883DB),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Center(
                                          child: Text(
                                            'تحديث  ',
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
                        ),
                      );
              }
            }));
  }
}
