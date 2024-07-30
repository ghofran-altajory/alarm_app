// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/module/ads_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<AdsModule> data = [];
  Future<List<AdsModule>> getData() async {
    var data = await firestore
        .collection('ads')
        .where('user_id', isEqualTo: auth.currentUser!.uid)
        .get();
    return data.docs.map((e) => AdsModule.fromJson(e.data())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFCFCFf),
        body: FutureBuilder<List<AdsModule>>(
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
                    ? Center(child: Image.asset("assets/Untitled design.png"))
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: adsWidget(
                              data: data[index],
                            ),
                          ),
                        ),
                      );
              }
            })

        //  Padding(
        //   padding: const EdgeInsets.all(10),
        //   child: Column(

        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       Padding(

        //         padding: const EdgeInsets.only(bottom: 4, top: 12),

        // child: Text(
        //   ': الإعلانات',
        //   textAlign: TextAlign.center,
        //   style: GoogleFonts.almarai(
        //     color: const Color(0xFF1883DB),
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        //       ),
        //       SizedBox(height: 20),
        //       Expanded(
        //         child: ListView.builder(
        //           itemCount: data.length,

        //           itemBuilder: (context, index) => Padding(
        //             padding: const EdgeInsets.all(10),
        //             child: adsWidget(
        //               data: data[index],
        //             ),

        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}

class adsWidget extends StatefulWidget {
  final AdsModule data;
  const adsWidget({super.key, required this.data});

  @override
  State<adsWidget> createState() => _adsWidgetState();
}

class _adsWidgetState extends State<adsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color(0x70C5E4FE),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.data.title.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.almarai(
                  color: const Color(0xFF1883DB),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.data.suTitle.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.almarai(
                  color: const Color.fromARGB(255, 0, 4, 7),
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(widget.data.place.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    color: const Color.fromARGB(255, 0, 4, 7),
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(widget.data.time.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    color: const Color.fromARGB(255, 0, 4, 7),
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(widget.data.cost.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    color: const Color.fromARGB(255, 0, 4, 7),
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
