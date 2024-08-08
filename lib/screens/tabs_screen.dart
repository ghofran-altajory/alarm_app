import 'dart:async';

import 'package:alarm_app/screens/ads_screen.dart';
import 'package:alarm_app/screens/archive.dart';
import 'package:alarm_app/screens/home_screen.dart';
import 'package:alarm_app/screens/icon_profile.dart';
import 'package:alarm_app/screens/notifications.dart';
import 'package:alarm_app/screens/profile_screen.dart';
import 'package:alarm_app/screens/setting_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  notification() async {
    var data = await firestore
        .collection('add')
        .where('user_id', isEqualTo: auth.currentUser!.uid)
        .get();
    List<CardContinerModule> dataNotification =
        data.docs.map((e) => CardContinerModule.fromJson(e.data())).toList();
    for (var element in dataNotification) {
      Timer(const Duration(seconds: 2), () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            // margin: const EdgeInsets.all(6.0),
            content: Text(element.title ?? "")));
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
                            builder: (context) => (Notifications())));
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
