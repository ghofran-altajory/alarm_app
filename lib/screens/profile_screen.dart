import 'package:alarm_app/module/profi_list_title.dart';
import 'package:alarm_app/screens/edit_profile_screen.dart';
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
  List<ProfiListTitlModule> data = [
    const ProfiListTitlModule(title: ' تعديل الملف الشخصي', icon: Icons.person),
    const ProfiListTitlModule(title: "A", icon: Icons.abc_outlined),
    const ProfiListTitlModule(title: "A", icon: Icons.abc_outlined),
    const ProfiListTitlModule(title: "A", icon: Icons.abc_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFCFCFf),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(15),
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
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const EditProfileScreen()),
                                  );
                                },
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
