import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class Archive extends StatefulWidget {
  const Archive({super.key});

  @override
  State<Archive> createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
// Pick an image.
// final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// // Capture a photo.
// final XFile? photo = await picker.pickImage(source: ImageSource.camera);
// // Pick a video.
// final XFile? galleryVideo =
//     await picker.pickVideo(source: ImageSource.gallery);
// // Capture a video.
// final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
// // Pick multiple images.
// final List<XFile> images = await picker.pickMultiImage();
// // Pick singe image or video.
// final XFile? media = await picker.pickMedia();
// // Pick multiple images and videos.
// final List<XFile> medias = await picker.pickMultipleMedia();
  void setUpCameraDelegate() {
    final ImagePickerPlatform instance = ImagePickerPlatform.instance;
    if (instance is CameraDelegatingImagePickerPlatform) {
      instance.cameraDelegate = MyCameraDelegate();
    }
  }

  @override
  void initState() {
    setUpCameraDelegate();
    super.initState();
  }
  //  late File imageFile;

  // _openGallary(BuildContext context) async {
  //   File picture = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   this.setState(() {
  //     imageFile = picture ;
  //   });
  //   Navigator.of(context).pop();
  // }

  // _openCamera(BuildContext context) async {
  //   var picture = await ImagePicker.pickImage(source: ImageSource.camera);
  //   this.setState(() {
  //     imageFile = picture;
  //   });
  //   Navigator.of(context).pop();
  // }

  // Future<void> _showChoiceDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //             title: Align(
  //                 alignment: Alignment.center,
  //                 child: Text(" : اختر الطريقة",
  //                     style: GoogleFonts.almarai(
  //                       color: const Color(0xFF1883DB),
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 18,
  //                     ))),
  //             content: SingleChildScrollView(
  //               child: ListBody(
  //                 children: <Widget>[
  //                  // _decideImageView(),
  //                   GestureDetector(
  //                     child: Align(
  //                         alignment: Alignment.centerRight,
  //                         child: Text("الكاميرا ",
  //                             style: GoogleFonts.almarai(
  //                               color: Color.fromARGB(255, 0, 0, 0),
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15,
  //                             ))),
  //                     onTap: () {
  //                      // _openCamera(context);
  //                     },
  //                   ),
  //                   SizedBox(height: 25),
  //                   GestureDetector(
  //                     child: Align(
  //                         alignment: Alignment.centerRight,
  //                         child: Text("معرض الصور ",
  //                             style: GoogleFonts.almarai(
  //                               color: Color.fromARGB(255, 0, 0, 0),
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15,
  //                             ))),
  //                     onTap: () {
  //                      // _openGallary(context);
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ));
  //       });
  // }

  // Widget _decideImageView() {
  //   if (imageFile == null) {
  //     return Text('لا توجد صور');
  //   } else {
  //     Image.file(imageFile, width: 400, height: 400);
  //   }
  // }

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
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            ': الأرشيف',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.almarai(
                              color: const Color(0xFF1883DB),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
//SizedBox(height: 30),
                      Text(
                        'هنا بإمكانك إضافة الصور الخاصة بك ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.almarai(
                          color: const Color(0xFF1883DB),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFFC5E4FE),
                        child: IconButton(
                            onPressed: () async {
                              try {
                                await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                              } on PlatformException catch (e) {
                                // Handle platform errors
                                print("Error picking image: $e");
                              }
                              // Future<void> getLostData() async {
                              // final ImagePicker picker = ImagePicker();
                              // await picker.pickImage(source: ImageSource.camera);
                              // final LostDataResponse response =
                              //     await picker.retrieveLostData();
                              // if (response.isEmpty) {
                              //   return;
                              // }
                              // final List<XFile>? files = response.files;
                              // if (files != null) {
                              //   // _handleLostFiles(files);
                              // } else {
                              //   // _handleError(response.exception);
                              // }
                              // }
                              // _showChoiceDialog(context);
                            },
                            icon: Center(
                              child: Icon(Icons.camera,
                                  color: Colors.blue, size: 45),
                            )),
                      ),
                      // IconButton(
                      //   color: Colors.amber,
                      //   onPressed: () {},
                      //   icon: Icon(Icons.camera, color: Colors.blue, size: 60),
                      // ),
                    ]),
              ))),
    );
  }
}

// ···
class MyCameraDelegate extends ImagePickerCameraDelegate {
  final ImagePicker picker = ImagePicker();
  @override
  Future<XFile?> takePhoto(
      {ImagePickerCameraDelegateOptions options =
          const ImagePickerCameraDelegateOptions()}) async {
    return await picker.pickImage(source: ImageSource.camera);
    // _takeAPhoto(options.preferredCameraDevice);
  }

  @override
  Future<XFile?> takeVideo(
      {ImagePickerCameraDelegateOptions options =
          const ImagePickerCameraDelegateOptions()}) async {
    return await picker.pickVideo(source: ImageSource.camera);
    // _takeAVideo(options.preferredCameraDevice);
  }
}
// // ···
