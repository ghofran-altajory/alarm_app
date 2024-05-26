import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('مرحبا بك ! لقد سجلت دخولك بنجاح',
          style:
              TextStyle(color: Color.fromARGB(0, 65, 65, 221), fontSize: 22)),
    ));
  }
}
