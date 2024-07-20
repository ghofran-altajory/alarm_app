import 'package:alarm_app/module/admin_module.dart';
import 'package:alarm_app/screens/admin_ads.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AdminControlPage extends StatefulWidget {
  AdminControlPage({super.key});

  @override
  State<AdminControlPage> createState() => _AdminControlPageState();
}

class _AdminControlPageState extends State<AdminControlPage> {
  List<AdminModule> ad = [
    const AdminModule(title: "  تعديل السعر", icon: Icons.settings),
    const AdminModule(title: "  التحكم في الاعلانات", icon: Icons.settings),
    const AdminModule(title: "  التحكم في طرق الدفع", icon: Icons.settings),
    const AdminModule(title: "  تسجيل الخروج", icon: Icons.logout)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: Text(
          ' التحكم',
          textAlign: TextAlign.center,
          style: GoogleFonts.almarai(
            color: const Color(0xFF1883DB),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFCFCFf),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: ad.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const AdminAds()),
                          );
                        },
                        leading: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: const Color(0xFF1883DB),
                          onPressed: () {},
                        ),
                        title: Text(
                          ad[index].title.toString(),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.almarai(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          (ad[index].icon),
                          color: const Color(0xFF1883DB),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
