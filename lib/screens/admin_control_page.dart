import 'package:alarm_app/main.dart';
import 'package:alarm_app/module/admin_module.dart';
import 'package:alarm_app/screens/admin_ads.dart';
import 'package:alarm_app/screens/admin_subscrib.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  @override
  Widget build(BuildContext context) {
    List<AdminModule> ad = [
      AdminModule(
        title: "  تعديل السعر",
        icon: Icons.settings,
        onTap: () {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const AdminSubscrib()));
        },
      ),
      AdminModule(
        title: "  التحكم في الاعلانات",
        icon: Icons.settings,
        onTap: () {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const AdminAds()));
        },
      ),
      // AdminModule(
      //   title: "  التحكم في طرق الدفع",
      //   icon: Icons.settings,
      //   onTap: () {},
      // ),
      AdminModule(
        title: "  تسجيل الخروج",
        icon: Icons.logout,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Align(
                      alignment: Alignment.center,
                      child: Text(" هل تريد تسجيل الخروج؟ ",
                          style: GoogleFonts.almarai(
                            color: const Color(0xFF1883DB),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))),
                  content: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: const Color(0x70C5E4FE),
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Text(
                                    'إلغاء',
                                    style: GoogleFonts.almarai(
                                      color: const Color(0xFF1883DB),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () async {
                                  await FirebaseAuth.instance
                                      .signOut()
                                      .then((_) {
                                    Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const ScreenRouter()),
                                    );
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF1883DB),
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Text(
                                    'نعم, متأكد',
                                    style: GoogleFonts.almarai(
                                      color: const Color(0xFFECF1FF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    ];
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
                        onTap: ad[index].onTap,
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
