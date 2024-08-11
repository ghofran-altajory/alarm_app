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
 
    
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFf),
      body: 
      
      SafeArea(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
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

                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 20, 36, 49),
                        child: IconButton(
                            onPressed:()=> showOption(context),
                            
                          
                            icon: const Center(
                              child: Icon(Icons.camera,
                                  color: Colors.blue, size: 45),
                            )),
                      ),
                    
                    ]),
              ))),
    );
  }
}

