import 'package:alarm_app/module/notification_modul.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<notification_modul> data = [
    notification_modul(
        title: "  دكتور العيون",
        suTitle: '''لديك اليوم موعد دكتور العيون 
عند الساعه 07:00 ص
في عيادة فينيسيا ''',
        time: "2د",
        icon1: Icons.notifications,
        icon2: Icons.cable,
        icon3: Icons.abc_rounded)
  ];
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(5),
            child: notificationWidget(
              data: data[index],
            ),
          ),
        ),
      ),
    );
  }
}

class notificationWidget extends StatefulWidget {
  final notification_modul data;
  const notificationWidget({super.key, required this.data});

  @override
  State<notificationWidget> createState() => _notificationWidgetState();
}

class _notificationWidgetState extends State<notificationWidget> {
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
            leading: Icon(Icons.cable),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.title,
                  // textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(
                //   width: 0,
                // ),
                Text(
                  widget.data.time,
                  // textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            subtitle: Text(
              widget.data.suTitle,
              // textAlign: TextAlign.center,
              style: GoogleFonts.almarai(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 14,
              ),
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
