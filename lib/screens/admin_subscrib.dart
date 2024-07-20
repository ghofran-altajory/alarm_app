import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSubscrib extends StatefulWidget {
  const AdminSubscrib({super.key});

  @override
  State<AdminSubscrib> createState() => _AdminSubscribState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController alarmumController = TextEditingController();

class _AdminSubscribState extends State<AdminSubscrib> {
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
          ' تعديل الأسعار',
          textAlign: TextAlign.center,
          style: GoogleFonts.almarai(
            color: const Color(0xFF1883DB),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              Container(
                height: 130,
                width: 500,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color(0x70C5E4FE),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          // ListTile(
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "منفرد",
                            style: GoogleFonts.almarai(
                              color: const Color.fromARGB(255, 24, 1, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text(
                              // textAlign: TextAlign.start,

                              'د.ل ',
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              // textAlign: TextAlign.start,

                              ' 5.00',
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // width: 92,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Row(children: [
                                        Text(
                                          "تعديل",
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ]),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    // width: 92,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Row(children: [
                                        Text(
                                          "حذفٍ",
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 130,
                width: 500,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color(0x70C5E4FE),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          // ListTile(
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "اسبوعي",
                            style: GoogleFonts.almarai(
                              color: const Color.fromARGB(255, 24, 1, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text(
                              // textAlign: TextAlign.start,

                              'د.ل ',
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              // textAlign: TextAlign.start,

                              ' 5.00',
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // width: 92,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Row(children: [
                                        Text(
                                          "تعديل",
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ]),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    // width: 92,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Row(children: [
                                        Text(
                                          "حذفٍ",
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 130,
                width: 500,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color(0x70C5E4FE),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          // ListTile(
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "شهري",
                            style: GoogleFonts.almarai(
                              color: const Color.fromARGB(255, 24, 1, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text(
                              // textAlign: TextAlign.start,

                              'د.ل ',
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              // textAlign: TextAlign.start,

                              ' 5.00',
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // width: 92,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Row(children: [
                                        Text(
                                          "تعديل",
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ]),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    // width: 92,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Row(children: [
                                        Text(
                                          "حذفٍ",
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 130,
                width: 500,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color(0x70C5E4FE),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          // ListTile(
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "سنوي",
                            style: GoogleFonts.almarai(
                              color: const Color.fromARGB(255, 24, 1, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Text(
                              // textAlign: TextAlign.start,

                              'د.ل ',
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              // textAlign: TextAlign.start,

                              ' 5.00',
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ]),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // width: 92,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Row(children: [
                                        Text(
                                          "تعديل",
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ]),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    // width: 92,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Row(children: [
                                        Text(
                                          "حذفٍ",
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  decoration: BoxDecoration(
                      color: const Color(0xFF1883DB),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'اختيار',
                    style: GoogleFonts.almarai(
                      color: const Color(0xFFECF1FF),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
