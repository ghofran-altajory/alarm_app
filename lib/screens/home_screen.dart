import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../module/card_continer_module.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.task),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Align(
                        alignment: Alignment.center,
                        child: Text("إضافة منبه ",
                            style: GoogleFonts.almarai(
                              color: const Color(0xFF2260FF),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ))),
                    content: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('اسم المنبه ',
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
                                return "!ادخل اسم المنبه";
                              }

                              return null;
                            },
                            controller: titleController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
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
                                  Text('الوصف ',
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
                                return "!ادخل الوصف";
                              }

                              return null;
                            },
                            controller: descriptionController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
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
                                  Text('نوع المنبه ',
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
                                return " !ادخل نوع المنبه ";
                              }

                              return null;
                            },
                            controller: descriptionController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  );
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
                // ListTile(

                // ),
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
                Row(
                  children: [
                    Text(widget.data.time),
                    const Icon(Icons.timelapse),
                  ],
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
