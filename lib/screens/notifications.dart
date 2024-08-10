import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:another_flushbar/flushbar.dart';
import '../module/card_continer_module.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
//   List<Notificationmodul> data = [
//     Notificationmodul(
//         title: "  دكتور العيون",
//         suTitle: '''لديك اليوم موعد دكتور العيون
// عند الساعه 07:00 ص
// في عيادة فينيسيا ''',
//         time: "2د",
//         icon1: Icons.notifications,
//         icon2: Icons.cable,
//         icon3: Icons.abc_rounded

// )
//   ];
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // /////

  List<CardContinerModule> data = [];

  Future<List<CardContinerModule>> getData() async {
    var data = await firestore
        .collection('add')
        .where('user_id', isEqualTo: auth.currentUser!.uid)
        .get();
    return data.docs.map((e) => CardContinerModule.fromJson(e.data())).toList();
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
                Navigator.of(context).pop();
              },
            ),
          ),
          toolbarHeight: kToolbarHeight,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 252, 252, 252),
          title: Text(
            ' الإشعارات',
            textAlign: TextAlign.center,
            style: GoogleFonts.almarai(
              color: const Color(0xFF1883DB),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder<List<CardContinerModule>>(
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

                return data.isEmpty
                    ? Center(
                        child: Image.asset(
                        "assets/s_box.png",
                      ))
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: NotificationmodulWidget(
                              data: data[index],
                            ),
                          ),
                        ),
                      );
              }
            }));

    //    Padding(
    //     padding: const EdgeInsets.only(top: 20),
    //     child: ListView.builder(
    //       itemCount: data.length,
    //       itemBuilder: (context, index) => Padding(
    //         padding: const EdgeInsets.all(5),
    //         child: NotificationmodulWidget(
    //           data: data[index],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class NotificationmodulWidget extends StatefulWidget {
  final CardContinerModule data;
  const NotificationmodulWidget({super.key, required this.data});

  @override
  State<NotificationmodulWidget> createState() =>
      _NotificationmodulWidgetState();
}

class _NotificationmodulWidgetState extends State<NotificationmodulWidget> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      decoration: BoxDecoration(
        color: _isChecked ? Colors.white : Color(0x70C5E4FE),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            leading: Icon(Icons.alarm),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      widget.data.title ?? "",
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.almarai(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                          widget.data.time ?? "",
                          // textAlign: TextAlign.center,
                          style: GoogleFonts.almarai(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          widget.data.date.toString(),
                          style: GoogleFonts.almarai(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Column(
                  children: [
                    Text(
                      widget.data.dec ?? "",
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.almarai(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.data.type ?? "",
                      style: GoogleFonts.almarai(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                  // _isCheckedWallet = false;
                });
              },
            
     
            ),
          ),
        ),
      ),

      // Column(

      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [

      //     Column(

      //       children: [

      //         SizedBox(height: 20),
      // Text(
      //   widget.data.title,
      //   textAlign: TextAlign.center,
      //   style: GoogleFonts.almarai(
      //     color: const Color.fromARGB(255, 0, 0, 0),
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),

      //
      // SizedBox(height: 22),
      // Text(
      //   widget.data.suTitle,
      //   textAlign: TextAlign.center,
      //   style: GoogleFonts.almarai(
      //     color: const Color.fromARGB(255, 0, 0, 0),
      //     fontSize: 14,
      //   ),
      // ),

      //
      //
      // Row(
      //           children: [
      //   Text(
      //     widget.data.time,
      //     textAlign: TextAlign.center,
      //     style: GoogleFonts.almarai(
      //       color: const Color.fromARGB(255, 0, 0, 0),
      //       fontSize: 12,
      //     ),
      //   ),
      // ],
      //         ),
      //         Column(
      //           children: [
      //             Row(
      //               children: [
      //                 IconButton(
      //                   onPressed: () {},
      //                   icon: const Icon(Icons.cable),
      //                 ),
      //                 IconButton(
      //                   onPressed: () {},
      //                   icon: const Icon(Icons.cable),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

Future mySnackBar(String message, bool isSuccess, BuildContext context) async {
  Flushbar(
    message: message,
    icon: Icon(
      isSuccess ? Icons.check_sharp : Icons.warning_amber_rounded,
      size: 28.0,
      color: Colors.blue,
    ),
    margin: const EdgeInsets.all(6.0),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    textDirection: Directionality.of(context),
    borderRadius: BorderRadius.circular(12),
    duration: const Duration(seconds: 4),
    leftBarIndicatorColor: Colors.blue,
  ).show(context);
}
