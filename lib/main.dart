import 'package:alarm_app/screens/about2_screen.dart';
import 'package:alarm_app/screens/about_screen.dart';
import 'package:alarm_app/screens/admin_splash.dart';
import 'package:alarm_app/screens/archive.dart';
import 'package:alarm_app/screens/personal_data.dart';
import 'package:alarm_app/screens/splash_screen.dart';
import 'package:alarm_app/screens/tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/notifications.dart';
import 'screens/welcome_screen.dart';
import 'dart:io' show File;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check user login status
  //final isLoggedIn = await AuthService.isUserLoggedIn();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        // providers: [
        // ChangeNotifierProvider<DarkThemeProvider>(
        //   create: (_) {
        //     return DarkThemeProvider();
        //   },
        // ),
        // ],
        // child:
        MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
            ),
            home:
                //SplashScreen()
                //AboutScreen()
                //Archive()
                // Modifyscreen(),
                // AdminSubscrib()
                
                TabsScreen()
            // SubscribeScreen()
            // IconProfile(),
            // CheckData(),
            // PersonalData()
            // AdminSplash()
            // PersonalData()
            // Notifications()

            // PersonalData()

            // TabsScreen()
            // AdminLogin()
            //AdminLogin()

            // ReminderData()
            // CheckData()

            // TabsScreen()

            //
            //SplashScreen()
            //SubscribeScreen()
            // PaymentMethod()
// CheckData()
            // ignore: prefer_const_constructors

            );
  }
}

class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? const TabsScreen()
        : const WelcomeScreen();
  }
}

class Modifyscreen extends StatefulWidget {
  const Modifyscreen({super.key});

  @override
  State<Modifyscreen> createState() => _ModifyscreenState();
}

class _ModifyscreenState extends State<Modifyscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Modify Product',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Picture',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.width / 20,
            ),
            Divider(
              height: 1,
              color: Colors.blue,
            ),
            SizedBox(height: 550, child: ImageScreen())
          ],
        ),
      ),
    );
  }
}

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List<File?> images = [];
  // File? imageFile;

  showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('make a choice'),
        content: SingleChildScrollView(
          child: Column(children: [
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () => imageFormGallery(context),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Camera'),
              onTap: () => imageFormCamera(context),
            ),
          ]),
        ),
      ),
    );
  }

  Future imageFormGallery(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return; //كان مادرتش هذي حيطلع خط اصفر
    setState(() {
      // imageFile = File(image.path);
      images.add(File(image.path));
    });
    Navigator.pop(context);
  }

  Future imageFormCamera(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      // imageFile = image as File;
      images.add(File(image.path));
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // if (imageFile != null)
          Expanded(
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Image.file(File(images[index]!.path)),
                      // Image.file(File(imageFile!.path)),
                      Positioned(
                          right: 2,
                          top: 2,
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                images.removeAt(index);
                              });
                            },
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () => showOption(context),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: const Row(
                children: [
                  Icon(Icons.image_search, color: Colors.blue),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Upload Picture',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
