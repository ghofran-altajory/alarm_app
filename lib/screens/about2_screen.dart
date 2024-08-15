import 'package:alarm_app/screens/admin_subscrib.dart';
import 'package:alarm_app/screens/subscribe_screen.dart';
import 'package:alarm_app/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About2Screen extends StatefulWidget {
  const About2Screen({super.key});

  @override
  State<About2Screen> createState() => _About2ScreenState();
}

class _About2ScreenState extends State<About2Screen> {
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
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const WelcomeScreen()));
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
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
                child: Image.asset('assets/alarm logo@3x.png',
                    width: 150, height: 150)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(':نبذه عن التطبيق',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                      color: const Color(0xFF1883DB),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 15,
                ),
                Text(
                    '''هو تطبيق منبه لذوي كبار السن و الاحتياجات“ Your Alarm “ ''',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                      color: const Color(0xFF1883DB),
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                Text('''
الخاصة لمساعدتهم على تذكر مواعيد الادوية والمراجعات 
الطبية,حيث يوفر الية تذكير بالمواعيد القريبة للحالة من خلال
 ارسال اشعارات عبر التطبيق ويوفر ايضا سجل صحي كامل
  عن الحالة الصحية والاجراءات السابقة ويتم الاحتفاظ ببيانات المريض الصحية في مكان امن لا يعرضها للتلف او الضياع ''',
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
                SizedBox(
                  height: 25,
                ),
                Text(" استخدام التطبيق عن طريق الاشتراك بإحدى الأنواع التالية",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                      color: const Color(0xFF1883DB),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 25,
                ),
                Text('''منفرد": يوفر لك عدد تنبيهات منفصلة حسب اختيارك  " _
                اسبوعي": يوفر لك عدد تنبيهات على مدار 7 ايام " _
                شهري": يوفر لك عدد تنبيهات على مدار 30 يوم " _
                سنوي": يوفر لك عدد تنبيهات على مدار 365 يوم " _''',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                      color: const Color(0xFF1883DB),
                      // fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
              ],
            ),
            SizedBox(
              height: 25,
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
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SubscribeScreen()));
                  },
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
