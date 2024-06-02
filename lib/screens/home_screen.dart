import 'package:alarm_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => const ScreenRouter()),
                (route) => false);
          });
        }),
        body: const Center(
          child: Text('مرحبا بك ! لقد سجلت دخولك بنجاح',
              style: TextStyle(color: Colors.black, fontSize: 22)),
        ));
  }
}
