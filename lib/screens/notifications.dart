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
        suTitle:
            "  لديك اليوم موعد دكتور العيون عند الساعة 7:00 ص في عيادة فينيسيا",
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: const BoxDecoration(
        color: Color(0x70C5E4FE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.data.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.almarai(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.data.suTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.almarai(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 12,
            ),
          ),
          Text(
            widget.data.time,
            textAlign: TextAlign.center,
            style: GoogleFonts.almarai(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 12,
            ),
          ),
        ],
      ),
     
    );
  }
}
