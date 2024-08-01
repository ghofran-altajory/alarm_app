import 'dart:developer';

import 'package:alarm_app/screens/check_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonalData extends StatefulWidget {
  PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController familynamecontroller = TextEditingController();
  TextEditingController subcontroller = TextEditingController();
  TextEditingController emilecontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();
  int _selectedValue = 0;
  bool isTrue = false;
  bool isClick = false;
  bool isFeMale = false;
  bool isMale = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future sendEmail() async {
    final url = Uri.parse(" https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_1m51dcj";
    const templateId = "template_hcsujos";
    //USERR ID
    const userId = "";

    final response = await http.post(url,
        headers: {'content-Type': 'application/json'},
        body: json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "name": familynamecontroller.text,
            " subject": subcontroller.text,
            " message": messagecontroller.text,
            "user_email": emilecontroller.text,
          },
        }));
    return response.statusCode;
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Dialog(
                child: SizedBox(
              height: 600,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(" : اضافة ارقام اخرى",
                        style: GoogleFonts.almarai(
                          color: const Color(0xFF1883DB),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(':الاسم  ',
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
                    const SizedBox(height: 5),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل الاسم  ";
                        }

                        return null;
                      },
                      controller: familynamecontroller,
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
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(':عنوان الرسالة ',
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
                    const SizedBox(height: 5),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل العنوان";
                        }

                        return null;
                      },
                      controller: subcontroller,
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
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(':البريد الالكتروني ',
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
                    const SizedBox(height: 5),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!ادخل البريد";
                        }

                        return null;
                      },
                      controller: emilecontroller,
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
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(':الرسالة  ',
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
                    const SizedBox(height: 5),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " !ادخل  الرسالة ";
                        }

                        return null;
                      },
                      controller: messagecontroller,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      GestureDetector(
                        onTap: () {
                          familynamecontroller.clear();
                          subcontroller.clear();
                          messagecontroller.clear();
                          emilecontroller.clear();
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color(0x70C5E4FE),
                              borderRadius: BorderRadius.circular(22)),
                          child: Text(
                            'إلغاء',
                            style: GoogleFonts.almarai(
                              color: const Color(0xFF1883DB),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          sendEmail();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color(0xFF1883DB),
                              borderRadius: BorderRadius.circular(22)),
                          child: Text(
                            'إرسال',
                            style: GoogleFonts.almarai(
                              color: const Color(0xFFECF1FF),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            )),
          );
        });
  }

  ////
  // List<PersonaldataModule> data = [];
  void _handleRadioValueChanged(int value) {
    setState(() {
      _selectedValue = value;
    });
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
          ' البيانات الشخصية',
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(' : الاسم الكامل',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.almarai(
                          color: const Color(0xFF000000),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 13),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: namecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!الرجاء إدخال  اسم المستخدم ";
                        }

                        return null;
                      },
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
                  Text(': رقم الهاتف ',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.almarai(
                          color: const Color(0xFF000000),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 13),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: phonecontroller,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!الرجاء إدخال  رقم الهاتف ";
                        }

                        return null;
                      },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          _showChoiceDialog(context);
                        },
                        icon: const Icon(Icons.add),
                      ),
                      Text('لإضافة اشخاص متابعين',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                              color: const Color(0xFF000000),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 45),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('الجنس',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.almarai(
                          color: const Color(0xFF000000),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('ذكر',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF000000),
                            fontSize: 14,
                          )),
                      Radio<int>(
                        value: 1, // Unique value for each radio button
                        groupValue: _selectedValue,
                        onChanged: (value) => setState(() {
                          _selectedValue = value!;
                          isMale = true;
                          isFeMale = false;
                        }),
                      ),
                      Text('انثى',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF000000),
                            fontSize: 14,
                          )),
                      Radio<int>(
                        value: 2,
                        groupValue: _selectedValue,
                        onChanged: (value) => setState(() {
                          _selectedValue = value!;

                          isFeMale = true;
                          isMale = false;
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  isClick
                      ? Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                              color: const Color(0xFF1883DB),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                              child: const CircularProgressIndicator()),
                        )
                      : GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                setState(() {
                                  isClick = true;
                                });
                                await firestore
                                    .collection('personal_data')
                                    .add({
                                  'user_id': auth.currentUser!.uid,
                                  "name": namecontroller.text,
                                  "phone": phonecontroller.text,
                                  // "familyPhone": familyPhoneontroller.text,
                                  "gender": isFeMale ? 'انثى' : 'ذكر'
                                }).then((value) {
                                  // setState(() async {
                                  // data = await getData();
                                  // });
                                  // namecontroller.clear();
                                  // phonecontroller.clear();
                                  // familyPhoneontroller.clear();
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) => CheckData()));
                                });
                              } on FirebaseException catch (e) {
                                setState(() {
                                  isClick = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(e.message.toString())));
                                namecontroller.clear();
                                phonecontroller.clear();
                                // familyPhoneontroller.clear();
                              }
                            }
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
// class PersonaldataModule extends StatefulWidget {
 
//   final PersonaldataModule data;
//   const PersonaldataModule(
//       {super.key,
     
//       required this.data});

//   @override
//   State<PersonaldataModule> createState() => _PersonaldataModule();
// }

// class _PersonaldataModule extends State<PersonaldataModule> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(0.0),
//       child: Container(
//         // height: 90,
//         //width: 150,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(15)),
//           color: Color(0x70C5E4FE),
//         ),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.end,
//          children: [
//            const SizedBox(
//              height: 30,
//            ),
//            Text(' : الاسم الكامل',
//                textAlign: TextAlign.right,
//                style: GoogleFonts.almarai(
//                    color: const Color(0xFF000000),
//                    fontSize: 15,
//                    fontWeight: FontWeight.bold)),
//            const SizedBox(height: 13),
//            SizedBox(
//              width: 350,
//              child: TextFormField(
//                validator: (value) {
//                  if (value!.isEmpty) {
//                    return "!الرجاء إدخال  اسم المستخدم ";
//                  }
       
//                  return null;
//                },
//                decoration: InputDecoration(
//                  filled: true,
//                  fillColor: const Color(0x70C5E4FE),
//                  contentPadding: const EdgeInsets.symmetric(
//                      horizontal: 12, vertical: 4),
//                  border: OutlineInputBorder(
//                    borderSide: BorderSide.none,
//                    borderRadius: BorderRadius.circular(15.0),
//                  ),
//                  focusedBorder: const OutlineInputBorder(
//                      borderSide: BorderSide(color: Colors.blue)),
//                ),
//              ),
//            ),
//            const SizedBox(height: 30),
//            Text(': رقم الهاتف ',
//                textAlign: TextAlign.right,
//                style: GoogleFonts.almarai(
//                    color: const Color(0xFF000000),
//                    fontSize: 15,
//                    fontWeight: FontWeight.bold)),
//            const SizedBox(height: 13),
//            SizedBox(
//              width: 350,
//              child: TextFormField(
//                keyboardType: TextInputType.phone,
//                validator: (value) {
//                  if (value!.isEmpty) {
//                    return "!الرجاء إدخال  رقم الهاتف ";
//                  }
       
//                  return null;
//                },
//                decoration: InputDecoration(
//                  filled: true,
//                  fillColor: const Color(0x70C5E4FE),
//                  contentPadding: const EdgeInsets.symmetric(
//                      horizontal: 12, vertical: 4),
//                  border: OutlineInputBorder(
//                    borderSide: BorderSide.none,
//                    borderRadius: BorderRadius.circular(15.0),
//                  ),
//                  focusedBorder: const OutlineInputBorder(
//                      borderSide: BorderSide(color: Colors.blue)),
//                ),
//              ),
//            ),
//            const SizedBox(height: 30),
//            Text(':ارقام هواتف الاسرة ',
//                textAlign: TextAlign.right,
//                style: GoogleFonts.almarai(
//                    color: const Color(0xFF000000),
//                    fontSize: 15,
//                    fontWeight: FontWeight.bold)),
//            const SizedBox(height: 13),
//            Row(
//              children: [
//                IconButton(
//                  onPressed: () {
//                    showDialog(
//                        context: context,
//                        builder: (context) {
//                          return Dialog(
//                              child: SizedBox(
//                            height: 200,
//                            width: double.infinity,
//                            child: Padding(
//                              padding: const EdgeInsets.all(15),
//                              child: Column(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceEvenly,
//                                children: [
//                                  Text(" : اضافة ارقام اخرى",
//                                      style: GoogleFonts.almarai(
//                                        color: const Color(0xFF1883DB),
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 18,
//                                      )),
//                                  TextFormField(
//                                    keyboardType: TextInputType.phone,
//                                    // validator: (value) {
//                                    //   if (value!.isEmpty) {
//                                    //     return "!يرجى إدخال العدد";
//                                    //   }
//                                    //   if (value.length != Characters) {
//                                    //     return "أدخل ارقام فقط !";
//                                    //   }
//                                    //   return null;
//                                    // },
//                                    controller: familyPhoneontroller,
//                                    decoration: InputDecoration(
//                                      filled: true,
//                                      fillColor: const Color(0x70C5E4FE),
//                                      contentPadding:
//                                          const EdgeInsets.symmetric(
//                                              vertical: 2,
//                                              horizontal: 10),
//                                      border: OutlineInputBorder(
//                                          borderRadius:
//                                              BorderRadius.circular(18.0),
//                                          borderSide: BorderSide.none),
//                                      focusedBorder:
//                                          const OutlineInputBorder(
//                                              borderSide: BorderSide(
//                                                  color: Colors.blue)),
//                                    ),
//                                  ),
//                                  const SizedBox(
//                                    height: 10,
//                                  ),
//                                  Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.center,
//                                      children: [
//                                        GestureDetector(
//                                          onTap: () {
//                                            familyPhoneontroller.clear();
       
//                                            Navigator.pop(context);
//                                          },
//                                          child: Container(
//                                            padding:
//                                                const EdgeInsets.all(15),
//                                            decoration: BoxDecoration(
//                                                color: const Color(
//                                                    0x70C5E4FE),
//                                                borderRadius:
//                                                    BorderRadius.circular(
//                                                        22)),
//                                            child: Text(
//                                              'إلغاء',
//                                              style: GoogleFonts.almarai(
//                                                color: const Color(
//                                                    0xFF1883DB),
//                                                fontWeight:
//                                                    FontWeight.bold,
//                                                fontSize: 16,
//                                              ),
//                                            ),
//                                          ),
//                                        ),
//                                        const SizedBox(width: 15),
//                                        GestureDetector(
//                                          onTap: () {},
//                                          child: Container(
//                                            padding:
//                                                const EdgeInsets.all(15),
//                                            decoration: BoxDecoration(
//                                                color: const Color(
//                                                    0xFF1883DB),
//                                                borderRadius:
//                                                    BorderRadius.circular(
//                                                        22)),
//                                            child: Text(
//                                              'حفظ',
//                                              style: GoogleFonts.almarai(
//                                                color: const Color(
//                                                    0xFFECF1FF),
//                                                fontWeight:
//                                                    FontWeight.bold,
//                                                fontSize: 16,
//                                              ),
//                                            ),
//                                          ),
//                                        ),
//                                      ]),
//                                ],
//                              ),
//                            ),
//                          ));
//                        });
//                  },
//                  icon: Icon(Icons.add),
//                ),
//                const SizedBox(width: 45),
//                SizedBox(
//                  width: 250,
//                  child: TextFormField(
//                    keyboardType: TextInputType.phone,
//                    validator: (value) {
//                      if (value!.isEmpty) {
//                        return "!الرجاء إدخال  رقم الهاتف ";
//                      }
       
//                      return null;
//                    },
//                    decoration: InputDecoration(
//                      filled: true,
//                      fillColor: const Color(0x70C5E4FE),
//                      contentPadding: const EdgeInsets.symmetric(
//                          horizontal: 12, vertical: 4),
//                      border: OutlineInputBorder(
//                        borderSide: BorderSide.none,
//                        borderRadius: BorderRadius.circular(15.0),
//                      ),
//                      focusedBorder: const OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.blue)),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//            const SizedBox(
//              height: 30,
//            ),
//            Text('الجنس',
//                textAlign: TextAlign.right,
//                style: GoogleFonts.almarai(
//                    color: const Color(0xFF000000),
//                    fontSize: 15,
//                    fontWeight: FontWeight.bold)),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                Text('ذكر',
//                    textAlign: TextAlign.right,
//                    style: GoogleFonts.almarai(
//                      color: const Color(0xFF000000),
//                      fontSize: 14,
//                    )),
//                Radio<int>(
//                  value: 1, // Unique value for each radio button
//                  groupValue: _selectedValue,
//                  onChanged: (value) =>
//                      setState(() => _selectedValue = value!),
//                ),
//                Text('انثى',
//                    textAlign: TextAlign.right,
//                    style: GoogleFonts.almarai(
//                      color: const Color(0xFF000000),
//                      fontSize: 14,
//                    )),
//                Radio<int>(
//                  value: 2,
//                  groupValue: _selectedValue,
//                  onChanged: (value) =>
//                      setState(() => _selectedValue = value!),
//                ),
//              ],
//            ),
//            const SizedBox(height: 60),
//            GestureDetector(
//              onTap: () async {
//                if (formKey.currentState!.validate()) {
//                  // if (namecontroller.text.isEmpty &&
//                  //     phonecontroller.text.isEmpty &&
//                  //     familyPhoneontroller.text.isEmpty) {
//                  Navigator.of(context).push(CupertinoPageRoute(
//                      builder: (context) => CheckData()));
//                  namecontroller.clear();
//                  phonecontroller.clear();
//                  familyPhoneontroller.clear();
       
//                  // Navigator.pop(context);
//                  // }
//                }
//              },
//              child: Padding(
//                padding: const EdgeInsets.symmetric(
//                    horizontal: 62, vertical: 15),
//                child: Container(
//                  padding: const EdgeInsets.all(18),
//                  decoration: BoxDecoration(
//                      color: const Color(0xFF1883DB),
//                      borderRadius: BorderRadius.circular(30)),
//                  child: Center(
//                      child: Text(
//                    'التالي ',
//                    style: GoogleFonts.almarai(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 18,
//                    ),
//                  )),
//                ),
//              ),
//            ),
//          ],
//        ),
//       ),
//     );
//   }
// }

