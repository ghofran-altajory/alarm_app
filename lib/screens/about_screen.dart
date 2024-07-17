import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          'حول ',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
                child: Image.asset('assets/alarm logo@3x.png',
                    width: 100, height: 100)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(':نبذه عن التطبيق',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                      color: const Color(0xFF1883DB),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                Text('''
                
                تطبيق “ Your Alarm “ هو منبه لذوي كبار السن و الاحتياجات 
                الخاصة لمساعدتهم على تذكر مواعيد الادوية والمراجعات الطبية,
                حيث يوفر الية تذكير بالمواعيد القريبة للحالة من خلال ارسال 
                اشعارات عبر التطبيق ويوفر ايضا سجل صحي كامل عن الحالة الصحية والاجراءات السابقة ويتم الاحتفاظ ببيانات المريض الصحية 
                في مكان امن لا يعرضها لتلف او الضياع.''',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                      color: const Color(0xFF1883DB),
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    "يمكنك استخدام التطبيق عن طريق الاشتراك ى الانواع التالية :",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                      color: const Color(0xFF1883DB),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                Text('''
                
                تطبيق “ Your Alarm “ هو منبه لذوي كبار السن و الاحتياجات 
                الخاصة لمساعدتهم على تذكر مواعيد الادوية والمراجعات الطبية,
                حيث يوفر الية تذكير بالمواعيد القريبة للحالة من خلال ارسال 
                اشعارات عبر التطبيق ويوفر ايضا سجل صحي كامل عن الحالة الصحية والاجراءات السابقة ويتم الاحتفاظ ببيانات المريض الصحية 
                في مكان امن لا يعرضها لتلف او الضياع.''',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                      color: const Color(0xFF1883DB),
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconTheme(
                  data: const IconThemeData(
                    color: Color(0xFF1883DB),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('الاطلاع على الاسعار',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.almarai(
                        color: const Color(0xFF1883DB),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
