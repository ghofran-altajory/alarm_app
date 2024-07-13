import 'package:alarm_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../module/card_continer_module.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardContinerModule> data = [
    const CardContinerModule(
        title: "A", suTitle: "a", date: "الاحد , 12 مايو", time: "9:00 ص "),
    const CardContinerModule(
        title: "B", suTitle: "s", date: "الاحد , 12 مايو", time: "9:00 ص "),
    const CardContinerModule(
        title: "C", suTitle: "d", date: "الاحد , 12 مايو", time: "9:00 ص "),
    const CardContinerModule(
        title: "D", suTitle: "e", date: "الاحد , 12 مايو", time: "9:00 ص "),
    const CardContinerModule(
        title: "F", suTitle: "v", date: "الاحد , 12 مايو", time: "9:00 ص "),
    const CardContinerModule(
        title: "A", suTitle: "a", date: "الاحد , 12 مايو", time: "9:00 ص "),
    const CardContinerModule(
        title: "B", suTitle: "s", date: "الاحد , 12 مايو", time: "9:00 ص "),
    const CardContinerModule(
        title: "C", suTitle: "d", date: "الاحد , 12 مايو", time: "9:00 ص "),
    const CardContinerModule(
        title: "D", suTitle: "e", date: "الاحد , 12 مايو", time: "9:00 ص "),
    const CardContinerModule(
        title: "F", suTitle: "v", date: "الاحد , 12 مايو", time: "9:00 ص "),
  ];
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(5),
            child: CardContinerWidget(
              data: data[index],
            ),
          ),
        ),
      ),
    );
  }
}

class CardContinerWidget extends StatefulWidget {
  // final String title;
  // final String suTitle;
  // final String date;
  // final String time;
  final CardContinerModule data;
  const CardContinerWidget(
      {super.key,
      // required this.title,
      // required this.suTitle,
      // required this.date,
      required this.data});

  @override
  State<CardContinerWidget> createState() => _CardContinerWidgetState();
}

class _CardContinerWidgetState extends State<CardContinerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color(0xFFC5E4FE),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  // width: 92,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.timelapse),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.data.date,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    children: [
                      Text(widget.data.time),
                      const Icon(Icons.timelapse),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [Text(widget.data.title), Text(widget.data.suTitle)],
            ),
          ],
        ),
      ),
    );
  }
}
