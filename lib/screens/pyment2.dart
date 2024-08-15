import 'package:alarm_app/screens/done2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pyment2 extends StatefulWidget {
  const Pyment2({super.key});

  @override
  State<Pyment2> createState() => _Pyment2State();
}

class _Pyment2State extends State<Pyment2> {
  int _selectedValue = 1;
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
            ' طرق الدفع',
            textAlign: TextAlign.center,
            style: GoogleFonts.almarai(
              color: const Color(0xFF1883DB),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 22),
                    child: Text(' : الدفع عن طريق',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.almarai(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                      height: 60,
                      width: 500,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Color(0x70C5E4FE),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 21,
                              backgroundColor: const Color(0xFFC5E4FE),
                              child: Image.asset(
                                "assets/WhatsApp_icon.png",
                                width: 35,
                                height: 35,
                              ),
                            ),
                            title: Text(
                              "واتساب",
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            trailing: Radio<int>(
                              value: 1, // Unique value for each radio button
                              groupValue: _selectedValue,
                              onChanged: (value) =>
                                  setState(() => _selectedValue = value!),
                            ),
                          ),
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   // crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        // Radio<int>(
                        //   value: 1, // Unique value for each radio button
                        //   groupValue: _selectedValue,
                        //   onChanged: (value) =>
                        //       setState(() => _selectedValue = value!),
                        // ),
                        //     SizedBox(width: 10),
                        // Text(
                        //   "واتساب",
                        //   style: GoogleFonts.almarai(
                        //     color: const Color.fromARGB(255, 24, 1, 1),
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 18,
                        //   ),
                        // ),
                        // CircleAvatar(
                        //   radius: 21,
                        //   backgroundColor: const Color(0xFFC5E4FE),
                        //   child: Image.asset(
                        //     "assets/WhatsApp_icon.png",
                        //     width: 35,
                        //     height: 35,
                        //   ),
                        // ),
                        //   ],
                        // ),
                      )),
                  const SizedBox(height: 8),
                  Container(
                      height: 60,
                      width: 500,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Color(0x70C5E4FE),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 21,
                              backgroundColor: const Color(0xFFC5E4FE),
                              child: Image.asset(
                                "assets/telegram-icon2.png",
                                width: 28,
                                height: 28,
                              ),
                            ),
                            title: Text(
                              "تيليجرام",
                              style: GoogleFonts.almarai(
                                color: const Color.fromARGB(255, 24, 1, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            trailing: Radio<int>(
                              value: 2,
                              groupValue: _selectedValue,
                              onChanged: (value) =>
                                  setState(() => _selectedValue = value!),
                            ),
                          ),
                        ),
                      )),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   // crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  // Radio<int>(
                  //   value: 1, // Unique value for each radio button
                  //   groupValue: _selectedValue,
                  //   onChanged: (value) =>
                  //       setState(() => _selectedValue = value!),
                  // ),
                  //     SizedBox(width: 10),
                  // Text(
                  //   "واتساب",
                  //   style: GoogleFonts.almarai(
                  //     color: const Color.fromARGB(255, 24, 1, 1),
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 18,
                  //   ),
                  // ),
                  // CircleAvatar(
                  //   radius: 21,
                  //   backgroundColor: const Color(0xFFC5E4FE),
                  //   child: Image.asset(
                  //     "assets/WhatsApp_icon.png",
                  //     width: 35,
                  //     height: 35,
                  //   ),
                  // ),
                  //   ],
                  // ),

                  const SizedBox(height: 15),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text(' :  او على الرقم التالي ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.almarai(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(height: 8),
                  Container(
                      height: 60,
                      width: 500,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Color(0x70C5E4FE),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            leading: const CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xFFC5E4FE),
                                child: Icon(Icons.phone)),
                            title: Text(
                              "21891xxxxxxx+",
                              style: GoogleFonts.almarai(
                                color: const Color(0xFF180101),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            trailing: Radio<int>(
                              value: 3,
                              groupValue: _selectedValue,
                              onChanged: (value) =>
                                  setState(() => _selectedValue = value!),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: GestureDetector(
                      onTap: () async {
                        if (_selectedValue != 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Done2()),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15),
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
                  ),
                ])));
    
  }
}