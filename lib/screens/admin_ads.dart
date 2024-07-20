import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAds extends StatefulWidget {
  const AdminAds({super.key});

  @override
  State<AdminAds> createState() => _AdminAdsState();
}

class _AdminAdsState extends State<AdminAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ' التحكم في الاعلانات ',
          textAlign: TextAlign.center,
          style: GoogleFonts.almarai(
            color: const Color(0xFF1883DB),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 13),
              Text(': اسم الطبيب',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ),
              const SizedBox(height: 13),
              Text(': التخصص',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(
                  right: 3,
                  left: 15,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(': المستشفى',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(':مواعيد الدوام',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(': سعر الحجز',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.almarai(
                      color: const Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(right: 3, left: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0x70C5E4FE),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 62, vertical: 15),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: const Color(0xFF1883DB),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      'اضافة ',
                      style: GoogleFonts.almarai(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
