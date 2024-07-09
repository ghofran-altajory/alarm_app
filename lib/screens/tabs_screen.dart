import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFf),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFFFCFCFf),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            // radius: 2,
            backgroundColor: const Color(0xFFCAD6FF),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                )),
          ),
        ),
      ),
    );
  }
}
