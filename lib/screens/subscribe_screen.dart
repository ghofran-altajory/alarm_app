import 'package:alarm_app/screens/done_screen.dart';
import 'package:alarm_app/screens/payment_method.dart';
import 'package:alarm_app/screens/setting_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../module/edit_ads.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController alarmumController = TextEditingController();
  TextEditingController singlepriceController = TextEditingController();
  TextEditingController weekpriceController = TextEditingController();
  TextEditingController monthpriceController = TextEditingController();
  TextEditingController yearpriceController = TextEditingController();
  int isClick = -1;
  bool readOnly = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool isTrue = false;
  List<EditAds> data = [];

  Future<List<EditAds>> getData() async {
    var data = await firestore.collection('editAds').get();
    return data.docs.map((e) => EditAds.fromJson(e.data())).toList();
  }

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
            ' الأسعار',
            textAlign: TextAlign.center,
            style: GoogleFonts.almarai(
              color: const Color(0xFF1883DB),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder<List<EditAds>>(
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
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isClick = 0;
                                    });

                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    " : ادخل عدد التنبيهات",
                                                    style: GoogleFonts.almarai(
                                                      color: const Color(
                                                          0xFF1883DB),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ))),
                                            content: Form(
                                              key: formKey,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    // validator: (value) {
                                                    //   if (value!.isEmpty) {
                                                    //     return "!يرجى إدخال العدد";
                                                    //   }
                                                    //   if (value.length != Characters) {
                                                    //     return "أدخل ارقام فقط !";
                                                    //   }
                                                    //   return null;
                                                    // },
                                                    controller:
                                                        alarmumController,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: const Color(
                                                          0x70C5E4FE),
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 2,
                                                              horizontal: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                      focusedBorder:
                                                          const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .blue)),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              isTrue = false;
                                                            });
                                                            alarmumController
                                                                .clear();

                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0x70C5E4FE),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            22)),
                                                            child: Text(
                                                              'إلغاء',
                                                              style: GoogleFonts
                                                                  .almarai(
                                                                color: const Color(
                                                                    0xFF1883DB),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 15),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              isTrue = true;
                                                            });
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0xFF1883DB),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            22)),
                                                            child: Text(
                                                              'حفظ',
                                                              style: GoogleFonts
                                                                  .almarai(
                                                                color: const Color(
                                                                    0xFFECF1FF),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ])
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    height: 130,
                                    width: 500,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40)),
                                      border: Border.all(
                                        color: isClick == 0
                                            ? Color(0xFF1883DB)
                                            : Color(0x70C5E4FE),
                                      ),
                                      color: const Color(0x70C5E4FE),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "منفرد",
                                                style: GoogleFonts.almarai(
                                                  color: const Color.fromARGB(
                                                      255, 24, 1, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(children: [
                                                Text(
                                                  // textAlign: TextAlign.start,

                                                  'د.ل ',
                                                  style: GoogleFonts.almarai(
                                                    color: const Color.fromARGB(
                                                        255, 24, 1, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 70,
                                                  child: TextFormField(
                                                    readOnly: true,
                                                    controller:
                                                        singlepriceController,
                                                    decoration: InputDecoration(
                                                      hintText: data
                                                          .first.singleprice,
                                                      filled: true,
                                                      fillColor: const Color(
                                                          0x70C5E4FE),
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 2,
                                                              horizontal: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      // focusedBorder:
                                                      //     const OutlineInputBorder(
                                                      //         borderSide: BorderSide(
                                                      //             color: Colors
                                                      //                 .blue)),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isClick = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 130,
                                    width: 500,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      border: Border.all(
                                        color: isClick == 1
                                            ? Color(0xFF1883DB)
                                            : Color(0x70C5E4FE),
                                      ),
                                      color: Color(0x70C5E4FE),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Column(
                                            children: [
                                              // ListTile(
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "اسبوعي",
                                                style: GoogleFonts.almarai(
                                                  color: const Color.fromARGB(
                                                      255, 24, 1, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(children: [
                                                Text(
                                                  // textAlign: TextAlign.start,

                                                  'د.ل ',
                                                  style: GoogleFonts.almarai(
                                                    color: const Color.fromARGB(
                                                        255, 24, 1, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 70,
                                                  child: TextFormField(
                                                    readOnly: true,
                                                    controller:
                                                        weekpriceController,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          data.first.weekprice,
                                                      filled: true,
                                                      fillColor: const Color(
                                                          0x70C5E4FE),
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 2,
                                                              horizontal: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      // focusedBorder:
                                                      //     const OutlineInputBorder(
                                                      //         borderSide: BorderSide(
                                                      //             color: Colors
                                                      //                 .blue)),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isClick = 2;
                                    });
                                  },
                                  child: Container(
                                    height: 130,
                                    width: 500,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      border: Border.all(
                                        color: isClick == 2
                                            ? Color(0xFF1883DB)
                                            : Color(0x70C5E4FE),
                                      ),
                                      color: Color(0x70C5E4FE),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Column(
                                            children: [
                                              // ListTile(
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "شهري",
                                                style: GoogleFonts.almarai(
                                                  color: const Color.fromARGB(
                                                      255, 24, 1, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(children: [
                                                Text(
                                                  // textAlign: TextAlign.start,

                                                  'د.ل ',
                                                  style: GoogleFonts.almarai(
                                                    color: const Color.fromARGB(
                                                        255, 24, 1, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 70,
                                                  child: TextFormField(
                                                    readOnly: true,
                                                    controller:
                                                        monthpriceController,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          data.first.monthprice,
                                                      filled: true,
                                                      fillColor: const Color(
                                                          0x70C5E4FE),
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 2,
                                                              horizontal: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      // focusedBorder:
                                                      //     const OutlineInputBorder(
                                                      //         borderSide: BorderSide(
                                                      //             color: Colors
                                                      //                 .blue)),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isClick = 3;
                                    });
                                  },
                                  child: Container(
                                    height: 130,
                                    width: 500,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      border: Border.all(
                                        color: isClick == 3
                                            ? Color(0xFF1883DB)
                                            : Color(0x70C5E4FE),
                                      ),
                                      color: Color(0x70C5E4FE),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Column(
                                            children: [
                                              // ListTile(
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "سنوي",
                                                style: GoogleFonts.almarai(
                                                  color: const Color.fromARGB(
                                                      255, 24, 1, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(children: [
                                                Text(
                                                  // textAlign: TextAlign.start,

                                                  'د.ل ',
                                                  style: GoogleFonts.almarai(
                                                    color: const Color.fromARGB(
                                                        255, 24, 1, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 70,
                                                  child: TextFormField(
                                                    readOnly: true,
                                                    controller:
                                                        yearpriceController,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          data.first.yearprice,
                                                      filled: true,
                                                      fillColor: const Color(
                                                          0x70C5E4FE),
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 2,
                                                              horizontal: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      // focusedBorder:
                                                      //     const OutlineInputBorder(
                                                      //         borderSide: BorderSide(
                                                      //             color: Colors
                                                      //                 .blue)),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (isClick != -1 &&
                                        isClick != 0 &&
                                        !isTrue) {
                                      Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  const PaymentMethod()));
                                    } else if (isClick == 0 && isTrue) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF1883DB),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text(
                                      'اختيار',
                                      style: GoogleFonts.almarai(
                                        color: const Color(0xFFECF1FF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     showDialog(
                                //         context: context,
                                //         builder: (context) {
                                // return AlertDialog(
                                //   title: Align(
                                //       alignment: Alignment.center,
                                //       child: Text(" : ادخل عدد التنبيهات",
                                //           style: GoogleFonts.almarai(
                                //             color: const Color(0xFF1883DB),
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18,
                                //           ))),
                                //             content: Form(
                                //               key: formKey,
                                //               child: Column(
                                //                 mainAxisSize: MainAxisSize.min,
                                //                 children: [
                                //                   TextFormField(
                                //                     validator: (value) {
                                //                       if (value!.isEmpty) {
                                //                         return "!يرجى إدخال العدد";
                                //                       }
                                //                       if (value.length != Characters) {
                                //                         return "أدخل ارقام فقط !";
                                //                       }
                                //                       return null;
                                //                     },
                                //                     controller: alarmumController,
                                //                     decoration: InputDecoration(
                                //                       filled: true,
                                //                       fillColor: const Color(0x70C5E4FE),
                                //                       contentPadding:
                                //                           const EdgeInsets.symmetric(
                                //                               vertical: 2, horizontal: 10),
                                //                       border: OutlineInputBorder(
                                //                           borderRadius:
                                //                               BorderRadius.circular(18.0),
                                //                           borderSide: BorderSide.none),
                                //                       focusedBorder: const OutlineInputBorder(
                                //                           borderSide:
                                //                               BorderSide(color: Colors.blue)),
                                //                     ),
                                //                   ),
                                //                   const SizedBox(
                                //                     height: 10,
                                //                   ),
                                //                   Row(
                                //                       mainAxisAlignment:
                                //                           MainAxisAlignment.center,
                                //                       children: [
                                //                         GestureDetector(
                                //                           onTap: () {
                                //                             alarmumController.clear();

                                //                             Navigator.pop(context);
                                //                           },
                                //                           child: Container(
                                //                             padding: const EdgeInsets.all(15),
                                //                             decoration: BoxDecoration(
                                //                                 color: const Color(0x70C5E4FE),
                                //                                 borderRadius:
                                //                                     BorderRadius.circular(22)),
                                //                             child: Text(
                                //                               'إلغاء',
                                //                               style: GoogleFonts.almarai(
                                //                                 color: const Color(0xFF1883DB),
                                //                                 fontWeight: FontWeight.bold,
                                //                                 fontSize: 16,
                                //                               ),
                                //                             ),
                                //                           ),
                                //                         ),
                                //                         const SizedBox(width: 15),
                                //                         GestureDetector(
                                //                           onTap: () {
                                //                             (value) {
                                //                               if (value!.isEmpty) {
                                //                                 return "يرجى إدخال العدد";
                                //                               }
                                //                               // ignore: unrelated_type_equality_checks
                                //                               if (value.length != Characters) {
                                //                                 return "يرجى إدخال ارقام";
                                //                               }
                                //                               return null;
                                //                             };
                                //                             alarmumController.clear();
                                //                             Navigator.pop(context);
                                //                           },
                                //                           child: Container(
                                //                             padding: const EdgeInsets.all(15),
                                //                             decoration: BoxDecoration(
                                //                                 color: const Color(0xFF1883DB),
                                //                                 borderRadius:
                                //                                     BorderRadius.circular(22)),
                                //                             child: Text(
                                //                               'حفظ',
                                //                               style: GoogleFonts.almarai(
                                //                                 color: const Color(0xFFECF1FF),
                                //                                 fontWeight: FontWeight.bold,
                                //                                 fontSize: 16,
                                //                               ),
                                //                             ),
                                //                           ),
                                //                         ),
                                //                       ])
                                //                 ],
                                //               ),
                                //             ),
                                //           );
                                //         });
                                //   },
                                //   child: Container(
                                //       height: 130,
                                //       width: 500,
                                //       decoration: const BoxDecoration(
                                //         borderRadius: BorderRadius.all(Radius.circular(40)),
                                //         color: Color(0x70C5E4FE),
                                //       ),
                                //       child: Center(
                                //           child: Padding(
                                //               padding: const EdgeInsets.symmetric(
                                //                   horizontal: 115, vertical: 30),
                                //               child: Column(
                                //                 children: [
                                //                   Text(
                                //                     "منفرد",
                                //                     style: GoogleFonts.almarai(
                                //                       color:
                                //                           const Color.fromARGB(255, 24, 1, 1),
                                //                       fontWeight: FontWeight.bold,
                                //                       fontSize: 20,
                                //                     ),
                                //                   ),
                                //                   const SizedBox(
                                //                     height: 10,
                                //                   ),
                                //                   Row(
                                //                     children: [
                                //                       Text(
                                //                         // textAlign: TextAlign.start,

                                //                         'د.ل ',
                                //                         style: GoogleFonts.almarai(
                                //                           color: const Color.fromARGB(
                                //                               255, 24, 1, 1),
                                //                           fontWeight: FontWeight.bold,
                                //                           fontSize: 25,
                                //                         ),
                                //                       ),
                                //                       Text(
                                //                         // textAlign: TextAlign.start,

                                //                         ' 5.00',
                                //                         style: GoogleFonts.almarai(
                                //                           color: const Color.fromARGB(
                                //                               255, 24, 1, 1),
                                //                           fontWeight: FontWeight.bold,
                                //                           fontSize: 25,
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ],
                                //               )))),
                                // ),

                                // GestureDetector(
                                //   onTap: () {
                                //     Navigator.pop(context);
                                //   },
                                //   child: Container(
                                //     padding: const EdgeInsets.symmetric(
                                //         horizontal: 80, vertical: 15),
                                //     decoration: BoxDecoration(
                                //         color: const Color(0xFF1883DB),
                                //         borderRadius: BorderRadius.circular(30)),
                                //     child: Text(
                                //       'اختيار',
                                //       style: GoogleFonts.almarai(
                                //         color: const Color(0xFFECF1FF),
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
              }
            }));
  }
}
