import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizing/sizing_builder.dart';

import 'router/nav_router.dart';
import 'router/route_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/NavigationService.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Multi_community());
}

class Multi_community extends StatelessWidget {
  const Multi_community({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SizingBuilder(builder: () {
          return GetMaterialApp(
              initialRoute: Routes.splash,
              debugShowCheckedModeBanner: false,
              title: 'Text Scan',
              defaultTransition: Transition.fadeIn,
              getPages: NavRouter.generateRoute,
              navigatorKey: NavigationService.navigatorKey,
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ));
        });
      },
    );
  }
}

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   bool textScanning = false;
//
//   XFile? imageFile;
//
//   String scannedText = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Text Recognition"),
//       ),
//       body: Center(
//           child: SingleChildScrollView(
//         child: Container(
//             margin: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 if (textScanning) const CircularProgressIndicator(),
//                 if (!textScanning && imageFile == null)
//                   Container(
//                     width: 300,
//                     height: 300,
//                     color: Colors.grey[300]!,
//                   ),
//                 if (imageFile != null) Image.file(File(imageFile!.path)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 5),
//                         padding: const EdgeInsets.only(top: 10),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.white,
//                             onPrimary: Colors.grey,
//                             shadowColor: Colors.grey[400],
//                             elevation: 10,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0)),
//                           ),
//                           onPressed: () {
//                             getImage(ImageSource.gallery);
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 5),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(
//                                   Icons.image,
//                                   size: 30,
//                                 ),
//                                 Text(
//                                   "Gallery",
//                                   style: TextStyle(
//                                       fontSize: 13, color: Colors.grey[600]),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )),
//                     Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 5),
//                         padding: const EdgeInsets.only(top: 10),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.white,
//                             onPrimary: Colors.grey,
//                             shadowColor: Colors.grey[400],
//                             elevation: 10,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0)),
//                           ),
//                           onPressed: () {
//                             getImage(ImageSource.camera);
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 5),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(
//                                   Icons.camera_alt,
//                                   size: 30,
//                                 ),
//                                 Text(
//                                   "Camera",
//                                   style: TextStyle(
//                                       fontSize: 13, color: Colors.grey[600]),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   child: Text(
//                     scannedText,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 )
//               ],
//             )),
//       )),
//     );
//   }
//
//   void getImage(ImageSource source) async {
//     try {
//       final pickedImage = await ImagePicker().pickImage(source: source);
//       if (pickedImage != null) {
//         textScanning = true;
//         imageFile = pickedImage;
//         setState(() {});
//         getRecognisedText(pickedImage);
//       }
//     } catch (e) {
//       textScanning = false;
//       imageFile = null;
//       scannedText = "Error occured while scanning";
//       setState(() {});
//     }
//   }
//
//   void getRecognisedText(XFile image) async {
//     final inputImage = InputImage.fromFilePath(image.path);
//     final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
//     final RecognizedText recognizedText =
//         await textRecognizer.processImage(inputImage);
//
//     // final textDetector = GoogleMlKit.vision.textDetector();
//     // RecognisedText recognisedText = await textDetector.processImage(inputImage);
//     // await textDetector.close();
//     scannedText = "";
//     // for (TextBlock block in recognisedText.blocks) {
//     //   for (TextLine line in block.lines) {
//     //     scannedText = scannedText + line.text + "\n";
//     //   }
//     // }
//     String text = recognizedText.text;
//     for (TextBlock block in recognizedText.blocks) {
//       final Rect rect = block.boundingBox;
//       final List<Point<int>> cornerPoints = block.cornerPoints;
//       final String text = block.text;
//       final List<String> languages = block.recognizedLanguages;
//
//       for (TextLine line in block.lines) {
//         // Same getters as TextBlock
//         scannedText = "$scannedText${line.text}\n";
//         for (TextElement element in line.elements) {
//           // Same getters as TextBlock
//         }
//       }
//     }
//
//     await textRecognizer.close();
//
//     textScanning = false;
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
// }
