import 'package:alarm_app/main.dart';
import 'package:alarm_app/module/profi_list_title.dart';
import 'package:alarm_app/screens/about_screen.dart';
import 'package:alarm_app/screens/edit_profile_screen.dart';
import 'package:alarm_app/screens/setting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

int i = 1;

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<ProfiListTitlModule> data = [
      ProfiListTitlModule(
        title: ' تعديل الملف الشخصي',
        icon: Icons.person,
        onTap: () {
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (context) => const EditProfileScreen()));
        },
      ),
      ProfiListTitlModule(
        title: "الإعدادات",
        icon: Icons.settings,
        onTap: () {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const SettingScreen()));
        },
      ),
      ProfiListTitlModule(
        title: "حول",
        icon: Icons.question_mark,
        onTap: () {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const AboutScreen()));
        },
      ),
      // ProfiListTitlModule(
      //   title: "تسجيل الخروج",
      //   icon: Icons.logout,
      //   onTap: () {
      //     showDialog(
      //         context: context,
      //         builder: (context) {
      //           return AlertDialog(
      //             title: Align(
      //                 alignment: Alignment.center,
      //                 child: Text(" هل تريد تسجيل الخروج؟ ",
      //                     style: GoogleFonts.almarai(
      //                       color: const Color(0xFF1883DB),
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18,
      //                     ))),
      //             content: Form(
      //               key: formKey,
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: [
      //                   Row(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         GestureDetector(
      //                           onTap: () {
      //                             Navigator.pop(context);
      //                           },
      //                           child: Container(
      //                             padding: const EdgeInsets.all(15),
      //                             decoration: BoxDecoration(
      //                                 color: const Color(0x70C5E4FE),
      //                                 borderRadius: BorderRadius.circular(22)),
      //                             child: Text(
      //                               'إلغاء',
      //                               style: GoogleFonts.almarai(
      //                                 color: const Color(0xFF1883DB),
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 16,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         const SizedBox(width: 15),
      //                         GestureDetector(
      //                           onTap: () async {
      //                             await FirebaseAuth.instance
      //                                 .signOut()
      //                                 .then((_) {
      //                               Navigator.pushReplacement(
      //                                 context,
      //                                 CupertinoPageRoute(
      //                                     builder: (context) =>
      //                                         const ScreenRouter()),
      //                               );
      //                             });
      //                           },
      //                           child: Container(
      //                             padding: const EdgeInsets.all(15),
      //                             decoration: BoxDecoration(
      //                                 color: const Color(0xFF1883DB),
      //                                 borderRadius: BorderRadius.circular(22)),
      //                             child: Text(
      //                               'نعم, متأكد',
      //                               style: GoogleFonts.almarai(
      //                                 color: const Color(0xFFECF1FF),
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 16,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ])
      //                 ],
      //               ),
      //             ),
      //           );
      //         });
      //   },
      // ),
    ];

    return Scaffold(
        backgroundColor: const Color(0xFFFCFCFf),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ': الملف الشخصي',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.almarai(
                        color: const Color(0xFF1883DB),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                onTap: data[index].onTap,
                                leading: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios),
                                  color: const Color(0xFF1883DB),
                                  onPressed: () {},
                                ),
                                title: Text(
                                  data[index].title.toString(),
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.almarai(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(
                                  (data[index].icon),
                                  color: const Color(0xFF1883DB),
                                ));
                          }),
                    ),
                  ],
                ))));
  }
}
