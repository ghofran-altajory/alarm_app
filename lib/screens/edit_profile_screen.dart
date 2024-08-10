import 'package:alarm_app/screens/admin_subscrib.dart';
import 'package:alarm_app/screens/tabs_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../module/personal_data.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController familyphonecontroller = TextEditingController();
  TextEditingController emilecontroller = TextEditingController();
  bool isClick = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // /////

  List<PersonaldataModule> data = [];

  Future<List<PersonaldataModule>> getData() async {
    var data = await firestore
        .collection('personal_data')
        .where('user_id', isEqualTo: auth.currentUser!.uid)
        .get();
    return data.docs.map((e) => PersonaldataModule.fromJson(e.data())).toList();
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
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const TabsScreen()));
              },
            ),
          ),
          toolbarHeight: kToolbarHeight,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 252, 252, 252),
          title: Text(
            ' تعديل الملف الشخصي',
            textAlign: TextAlign.center,
            style: GoogleFonts.almarai(
              color: const Color(0xFF1883DB),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder<List<PersonaldataModule>>(
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
                if (data.isNotEmpty) {
                  namecontroller.text = data.first.name ?? "";
                  phonecontroller.text = data.first.phone ?? "";
                  familyphonecontroller.text = data.first.familyPhone ?? "";
                }

                return data.isEmpty
                    ? Center(child: Image.asset("assets/Untitled design.png"))
                    : SafeArea(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            //scrolling
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 20),
                                  //user name
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(':الاسم الكامل ',
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
                                  TextFormField(
                                    controller: namecontroller,
                                    //readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: data.first.name,
                                      filled: true,
                                      fillColor: const Color(0x70C5E4FE),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          borderSide: BorderSide.none),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                    ),
                                  ),
                                  const SizedBox(height: 13),
                                  // phone
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(' : رقم الهاتف',
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
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "!الرجاء إدخال رقم الهاتف ";
                                      }

                                      return null;
                                    },
                                    controller: phonecontroller,
                                    decoration: InputDecoration(
                                      hintText: data.first.phone,
                                      filled: true,
                                      fillColor: const Color(0x70C5E4FE),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          borderSide: BorderSide.none),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                    ),
                                  ),
                                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final sms = Uri.parse("");
                            final Uri smsLaunchUri = Uri(
                              scheme: 'sms',
                              // path: "92555452122",
                              queryParameters: <String, String>{
                                'body':
                                    Uri.decodeFull('''Download"YourAlarm"now!
Email:ayaya@gmail.com
Password:123456& Symbols are allowed!'''),
                              },
                            );

                            try {
                              if (await canLaunchUrl(smsLaunchUri)) {
                                await launchUrl(smsLaunchUri);
                              }
                            } catch (e) {
                              if (kDebugMode) {
                                print("error is (e) ==> $e");
                              }
                            }

                            // _showChoiceDialog(context);
                          }
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
                                  const SizedBox(height: 80),
                                  //ubdite

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      try {
                                        setState(() {
                                          isClick = true;
                                        });

                                        // getFavorites(coinId);
                                        var deletable = await firestore
                                            .collection('personal_data')
                                            .where("user_id",
                                                isEqualTo:
                                                    auth.currentUser!.uid)
                                            .where("name",
                                                isEqualTo: data.first.name)
                                            .where("phone",
                                                isEqualTo: data.first.phone)
                                            .get();
                                        firestore
                                            .collection('personal_data')
                                            .doc(deletable.docs.first.id
                                                .toString())
                                            .update({
                                          "name": namecontroller.text,
                                          "phone": phonecontroller.text,
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
                                          // data = await getData();
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
                                        phonecontroller.clear();
                                        namecontroller.clear();
                                        familyphonecontroller.clear();
                                        emilecontroller.clear();
                                      }

                                      // Navigator.pop(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 62, vertical: 15),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF1883DB),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Text(
                                        'تحديث',
                                        style: GoogleFonts.almarai(
                                          color: const Color(0xFFECF1FF),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
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
            }));
  }
}
