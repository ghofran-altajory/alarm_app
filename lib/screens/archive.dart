import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Archive extends StatefulWidget {
  const Archive({super.key});

  @override
  State<Archive> createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  List<File?> images = [];
  int counter = 1; // Counter to keep track of the index

  Future<void> showOption(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            ":اختر الطريقة",
            style: GoogleFonts.almarai(
              color: const Color(0xFF1883DB),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ListTile(
                  trailing: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'الكاميرا',
                    style: GoogleFonts.almarai(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onTap: () => imageFormCamera(context),
                ),
                ListTile(
                  title: Text(
                    'المعرض',
                    style: GoogleFonts.almarai(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.image,
                    color: Colors.blue,
                  ),
                  leading: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onTap: () => imageFormGallery(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> imageFormGallery(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      images.add(File(image.path));
      counter++; // Increment counter for next image
    });
    Navigator.pop(context);
  }

  Future<void> imageFormCamera(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      images.add(File(image.path));
      counter++; // Increment counter for next image
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFf),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  ':الأرشيف',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    color: const Color(0xFF1883DB),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Image.file(File(images[index]!.path)),
                            Positioned(
                              left: 5,
                              top: 6,
                              child: Container(
                                color: Colors.black.withOpacity(
                                    0.5), // Semi-transparent black background
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                child: Text(
                                  (index + 1)
                                      .toString(), // Display the index number
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 0,
                                top: 2,
                                child: Container(
                                    // color: Color.fromARGB(255, 29, 28, 28)
                                    //     .withOpacity(0.5),
                                    child: IconButton(
                                  icon: const Icon(
                                    size: 30,
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      images.removeAt(index);
                                    });
                                  },
                                )))
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 55,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1883DB),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            onPressed: () => showOption(context),
                            icon: const Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 45,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Text(
                //       ': الأرشيف',
                //       textAlign: TextAlign.center,
                //       style: GoogleFonts.almarai(
                //         color: const Color(0xFF1883DB),
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),

                // Text(
                //   'هنا بإمكانك إضافة الصور الخاصة بك ',
                //   textAlign: TextAlign.center,
                //   style: GoogleFonts.almarai(
                //     color: const Color(0xFF1883DB),
                //     fontSize: 15,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
