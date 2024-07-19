import 'package:alarm_app/screens/check_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalData extends StatefulWidget {
  PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  int _selectedValue = 0;
  void _handleRadioValueChanged(int value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: Text(
          ' البيانات الشخصية',
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
                const SizedBox(
                  height: 30,
                ),
                Text(' : الاسم الكامل',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.only(right: 3, left: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(': رقم الهاتف ',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.only(right: 3, left: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(':ارقام هواتف الاسرة ',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.only(right: 3, left: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x70C5E4FE),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
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
                Text('الجنس',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                        color: const Color(0xFF000000),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('ذكر',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.almarai(
                          color: const Color(0xFF000000),
                          fontSize: 14,
                        )),
                    Radio<int>(
                      value: 1, // Unique value for each radio button
                      groupValue: _selectedValue,
                      onChanged: (value) =>
                          setState(() => _selectedValue = value!),
                    ),
                    Text('انثى',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.almarai(
                          color: const Color(0xFF000000),
                          fontSize: 14,
                        )),
                    Radio<int>(
                      value: 2,
                      groupValue: _selectedValue,
                      onChanged: (value) =>
                          setState(() => _selectedValue = value!),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckData()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 62, vertical: 15),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1883DB),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        'التالي ',
                        style: GoogleFonts.almarai(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}