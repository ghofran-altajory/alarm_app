// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/module/card_continer_module.dart';
import 'package:alarm_app/screens/tabs_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReminderData extends StatefulWidget {
  const ReminderData({super.key});

  @override
  State<ReminderData> createState() => _ReminderDataState();
}

class _ReminderDataState extends State<ReminderData> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController alarmTypeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isClick = false;
//
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //  List<CardContinerModule> data = [];

// Future<List<CardContinerModule>> getData() async {
//     var data = await firestore
//         .collection('ReminderData')
//         .where('user_id', isEqualTo: auth.currentUser!.uid)
//         .get();
//     return data.docs.map((e) => CardContinerModule.fromJson(e.data())).toList();
//   }

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
      // body:  FutureBuilder<List<CardContinerModule>>(
      //       future: getData(),
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           return const Center(
      //               child: CircularProgressIndicator(
      //             backgroundColor: const Color(0xFF1883DB),
      //           ));
      //         } else if (snapshot.hasError) {
      //           return Center(child: Text('Error: ${snapshot.error}'));
      //         } else {
      //           data = snapshot.data ?? [];

      //           return data.isEmpty
      //               ? Center(child: Image.asset("assets/Untitled design.png"))
      //               : Padding(
      //                   padding: const EdgeInsets.symmetric(
      //                       horizontal: 15, vertical: 20),
      //                   child: ListView.builder(
      //                     itemCount: data.length,
      //                     itemBuilder: (context, index) => Padding(
      //                       padding: const EdgeInsets.all(5),
      //                       child: CardContinerWidget(
      //                         data: data[index],
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //         }
      //       })
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':اسم المنبه ',
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
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل اسم المنبه ";
                        }

                        return null;
                      },
                      controller: titleController,
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
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':الوصف ',
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
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل الوصف";
                        }

                        return null;
                      },
                      controller: descriptionController,
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
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(':نوع المنبه ',
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
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " !ادخل نوع المنبه ";
                        }

                        return null;
                      },
                      controller: alarmTypeController,
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
                    height: 5,
                  ),
                  const SizedBox(height: 13),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "!ادخل الوقت";
                            }

                            return null;
                          },
                          controller: timeController,
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
                      Text(':الوقت ',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      const SizedBox(
                        width: 7,
                      ),
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "!ادخل التاريخ";
                            }

                            return null;
                          },
                          controller: dateController,
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
                      Text(': التاريخ ',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
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
                                setState(() {
                                  isClick = true;
                                });
                                await firestore.collection('add').add({
                                  'user_id': auth.currentUser!.uid,
                                  "date": dateController.text,
                                  "time": timeController.text,
                                  "dec": descriptionController.text,
                                  "title": titleController.text,
                                  "type": alarmTypeController.text,
                                }).then((value) {
                                  // setState(() async {
                                  // data = await getData();
                                  // });

                                  titleController.clear();
                                  descriptionController.clear();
                                  alarmTypeController.clear();
                                  dateController.clear();
                                  timeController.clear();
                                });
                              } on FirebaseException catch (e) {
                                setState(() {
                                  isClick = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(e.message.toString())));

                                titleController.clear();
                                descriptionController.clear();
                                alarmTypeController.clear();
                                dateController.clear();
                                timeController.clear();
                                Navigator.pop(context);
                              }
                              setState(() {});
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

class CardContinerWidget extends StatefulWidget {
  final CardContinerModule data;
  const CardContinerWidget({super.key, required this.data});

  @override
  State<CardContinerWidget> createState() => _CardContinerWidgetState();
}

class _CardContinerWidgetState extends State<CardContinerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0x70C5E4FE),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.timelapse),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.data.date.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    // width: 92,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.timelapse),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            widget.data.time.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    widget.data.title.toString(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.data.dec.toString(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
