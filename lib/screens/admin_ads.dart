// ignore_for_file: unnecessary_import

import 'package:alarm_app/module/ads_module.dart';
import 'package:alarm_app/screens/admin_control_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAds extends StatefulWidget {
  const AdminAds({super.key});

  @override
  State<AdminAds> createState() => _AdminAdsState();
}

class _AdminAdsState extends State<AdminAds> {
   TextEditingController costController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController titleController = TextEditingController();
   bool isClick = false;

   //
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
//
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
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => AdminControlPage()));
            },
          ),
        ),
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: Text(
          ' التحكم في الاعلانات ',
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
              const SizedBox(height: 13),
              Text(': اسم الطبيب',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 15),
                child: TextFormField(
                  controller: titleController,
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
              Text(': التخصص',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(
                  right: 3,
                  left: 15,
                ),
                child: TextFormField(
                   controller: subTitleController,
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
              Text(': المستشفى',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 15),
                child: TextFormField(
                   controller: placeController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
              Text(':مواعيد الدوام',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 15),
                child: TextFormField(
                   controller: timeController,
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
                height: 20,
              ),
              Text(': سعر الحجز',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 15),
                child: TextFormField(
                   controller: costController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                
                    try {
                      setState(() {
                        isClick = true;
                      });
                      await firestore.collection('ads').add({
                        'user_id': auth.currentUser!.uid,
                        "cost": costController.text,
                        "time": timeController.text,
                        "subTitle": subTitleController.text,
                        "title": titleController.text,
                        "place": placeController.text,
                      }).then((value) {
                        

                        titleController.clear();
                        subTitleController.clear();
                        placeController.clear();
                        costController.clear();
                        timeController.clear();
                        setState(() {
                          isClick = false;
                        });
                      });
                    } on FirebaseException catch (e) {
                      setState(() {
                        isClick = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.message.toString())));

                     titleController.clear();
                        subTitleController.clear();
                        placeController.clear();
                        costController.clear();
                        timeController.clear();
                      Navigator.pop(context);
                    }
                    setState(() {});

                   
                  
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
                      'اضافة ',
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
      )),
    );
  }
}
