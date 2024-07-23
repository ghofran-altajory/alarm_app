import 'package:alarm_app/screens/check_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalData extends StatefulWidget {
  PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController familyPhoneontroller = TextEditingController();
  int _selectedValue = 0;
  bool isTrue = false;
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
            child: Form(
              key: formKey,
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
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!الرجاء إدخال  اسم المستخدم ";
                        }

                        return null;
                      },
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
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "!الرجاء إدخال  رقم الهاتف ";
                        }

                        return null;
                      },
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
                  Row(
                    children: [
                      FloatingActionButton(
                        backgroundColor: const Color(0xFF1883DB),
                        child: Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Align(
                                      alignment: Alignment.center,
                                      child: Text(" : اضافة ارقام اخرى",
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
                                        TextFormField(
                                          keyboardType: TextInputType.phone,
                                          // validator: (value) {
                                          //   if (value!.isEmpty) {
                                          //     return "!يرجى إدخال العدد";
                                          //   }
                                          //   if (value.length != Characters) {
                                          //     return "أدخل ارقام فقط !";
                                          //   }
                                          //   return null;
                                          // },
                                          controller: familyPhoneontroller,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: const Color(0x70C5E4FE),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 2,
                                                    horizontal: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                borderSide: BorderSide.none),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue)),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  familyPhoneontroller.clear();

                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0x70C5E4FE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22)),
                                                  child: Text(
                                                    'إلغاء',
                                                    style: GoogleFonts.almarai(
                                                      color: const Color(
                                                          0xFF1883DB),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF1883DB),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22)),
                                                  child: Text(
                                                    'حفظ',
                                                    style: GoogleFonts.almarai(
                                                      color: const Color(
                                                          0xFFECF1FF),
                                                      fontWeight:
                                                          FontWeight.bold,
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
                      const SizedBox(width: 45),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "!الرجاء إدخال  رقم الهاتف ";
                            }

                            return null;
                          },
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
                    ],
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
                      if (formKey.currentState!.validate()) {
                        if (namecontroller.text.isEmpty &&
                            phonecontroller.text.isEmpty &&
                            familyPhoneontroller.text.isEmpty) {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => CheckData()));
                          namecontroller.clear();
                          phonecontroller.clear();
                          familyPhoneontroller.clear();

                          // Navigator.pop(context);
                        }
                      }
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
      ),
    );
  }
}
