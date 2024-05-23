import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        //هنا لون الخلفية
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text('ALARM'),
          //اسم التطبيق من فوق
          backgroundColor: Colors.green[200],
        ),
        body: const Center(
          child: Image(
            image: AssetImage('assets/alarm.jpg'),
            ),
        ),
      ),
    ),
  );
}
