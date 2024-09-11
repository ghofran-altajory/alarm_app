import 'dart:async';

import 'package:alarm_app/screens/ads_screen.dart';
import 'package:alarm_app/screens/archive.dart';
import 'package:alarm_app/screens/home_screen.dart';
import 'package:alarm_app/screens/icon_profile.dart';
import 'package:alarm_app/screens/notifications.dart';
import 'package:alarm_app/screens/profile_screen.dart';
import 'package:alarm_app/screens/setting_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../module/card_continer_module.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentPageIndex = 0;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // /////
  @override
  void initState() {
    notification();
    super.initState();
  }

//   Future mySnackBar(
//       String message, bool isSuccess, BuildContext context) async {

//     Flushbar(
//       message: message,
//       // messageText:  var data = await firestore
//     //     .collection('add')
//     //     .where('user_id', isEqualTo: auth.currentUser!.uid)
//     //     .get();

//     // data.docs.map((e) => CardContinerModule.fromJson(e.data())).toList();
// // ,
//       icon: Icon(
//         isSuccess ? Icons.check_sharp : Icons.warning_amber_rounded,
//         size: 28.0,
//         color: Colors.blue,
//       ),
//       margin: const EdgeInsets.all(6.0),
//       flushbarStyle: FlushbarStyle.FLOATING,
//       flushbarPosition: FlushbarPosition.TOP,
//       textDirection: Directionality.of(context),
//       borderRadius: BorderRadius.circular(12),
//       duration: const Duration(seconds: 2),
//       leftBarIndicatorColor: Colors.blue,
//     ).show(context);
//   }
  notification() async {
    var data = await firestore
        .collection('add')
        .where('user_id', isEqualTo: auth.currentUser!.uid)
        .get();
    List<CardContinerModule> dataNotification =
        data.docs.map((e) => CardContinerModule.fromJson(e.data())).toList();
    for (var element in dataNotification) {
      Timer(const Duration(minutes: 2), () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            // shape: TextStyle(fontSize: 20),
            backgroundColor: const Color(0xFFC5E4FE),
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 210,
                left: 30,
                right: 30),
            // margin: const EdgeInsets.all(6.0),
            content: ListTile(
              leading: Text(
                element.time ?? "",
                // textAlign: TextAlign.center,
                style: GoogleFonts.almarai(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      // Text(
                      //   element.time ?? "",
                      //   // textAlign: TextAlign.center,
                      //   style: GoogleFonts.almarai(
                      //     color: const Color.fromARGB(255, 0, 0, 0),
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      SizedBox(height: 4),
                    ],
                  ),

                  // SizedBox(
                  //   width: 0,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            element.title ?? "",
                            // element.dec ?? "",
                            // textAlign: TextAlign.center,
                            style: GoogleFonts.almarai(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            element.dec ?? "",
                            style: GoogleFonts.almarai(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // subtitle: Row(
              //   children: [
              //     Column(
              //       children: [
              //         // Text(
              //         //   element.time ?? "",
              //         //   // textAlign: TextAlign.center,
              //         //   style: GoogleFonts.almarai(
              //         //     color: const Color.fromARGB(255, 0, 0, 0),
              //         //     fontSize: 14,
              //         //   ),
              //         // ),
              //       ],
              //     ),
              //   ],
              // ),
              trailing: const Icon(Icons.alarm_rounded, size: 35),
              //  Row(
              //   children: [
              //     Icon(Icons.abc),
              //     Column(
              //       children: [
              //         Text(
              //           textAlign: TextAlign.right,
              //           style: GoogleFonts.almarai(
              //             color: const Color.fromARGB(255, 24, 1, 1),
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //           ),
              // element.title ?? "",
              //           selectionColor: Color.fromARGB(255, 0, 4, 7),
              //         ),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Text(
              //           textAlign: TextAlign.right,
              //           style: GoogleFonts.almarai(
              //             color: const Color.fromARGB(255, 24, 1, 1),
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //           ),
              //           element.dec ?? "",
              //           selectionColor: Color.fromARGB(255, 0, 4, 7),
              //         ),
              //       ],
              //     ),
              //   ],
              // )
            )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFf),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFFFCFCFf),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xFFC5E4FE),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const IconProfile()));
                  },
                  icon: const Center(
                    child: Icon(size: 30, Icons.medical_information),
                  )),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  // radius: 2,
                  backgroundColor: const Color(0xFFC5E4FE),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => (const Notifications())));
                      },
                      icon: const Icon(
                        Icons.notifications_active,
                      )),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  // radius: 2,
                  backgroundColor: const Color(0xFFC5E4FE),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => const SettingScreen()));
                      },
                      icon: const Icon(
                        Icons.settings,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFFFCFCFf),
        animationDuration: const Duration(milliseconds: 1000),
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.home_filled,
              color: Color(0xFF1883DB),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.photo,
              color: Color(0xFF1883DB),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: Color(0xFF1883DB),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_search_rounded,
              color: Color(0xFF1883DB),
            ),
            label: '',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
      ),
      body: <Widget>[
        const HomeScreen(),
        // Container(
        //   color: const Color(0xFFFCFCFf),
        //   alignment: Alignment.center,
        //   child: const Text(''),
        // ),
        const Archive(),
        //Container(
        //color: const Color(0xFFFCFCFf),
        //alignment: Alignment.center,
        //child: const Text(''),
        //),
        const ProfileScreen(),
        //Container(
        //color: const Color(0xFFFCFCFf),
        //alignment: Alignment.center,
        //child: const Text(''),
        //),
        const AdsScreen(),

        // Container(
        //   color: const Color(0xFFFCFCFf),
        //   alignment: Alignment.center,
        //   child: const Text(''),
        // ),
        Container(
          color: const Color(0xFFFCFCFf),
          alignment: Alignment.center,
          child: const Text(''),
        ),
      ][currentPageIndex],
    );
  }
}
