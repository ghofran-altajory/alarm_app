import 'package:alarm_app/module/ads_module.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  List<adsModule> data = [
    adsModule(
        title: "الطبيب أحمد علي",
        suTitle: "دكتور قلب",
        place: "متواجد في مصحه الامل",
        time: " من الساعة 8:00 ص الى 8:00 م ",
        cost: "سعر الحجز 50 د.ل",
        icon: Icons.abc)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFf),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4, top: 45),
              child: Text(
                ': الإعلانات',
                textAlign: TextAlign.center,
                style: GoogleFonts.almarai(
                  color: const Color(0xFF1883DB),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: adsWidget(
                    data: data[index],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class adsWidget extends StatefulWidget {
  final adsModule data;
  const adsWidget({super.key, required this.data});

  @override
  State<adsWidget> createState() => _adsWidgetState();
}

class _adsWidgetState extends State<adsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color(0x70C5E4FE),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.data.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.almarai(
                              color: const Color(0xFF1883DB),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.data.suTitle,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.almarai(
                              color: const Color.fromARGB(255, 0, 4, 7),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(widget.data.place,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 0, 4, 7),
                                fontSize: 15,
                              )),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(widget.data.time,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 0, 4, 7),
                                fontSize: 15,
                              )),
                          Text(widget.data.cost,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 0, 4, 7),
                                fontSize: 15,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
