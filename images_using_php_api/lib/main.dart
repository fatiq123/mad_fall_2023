import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:images_using_php_api/view_image.dart';

void main() {
  // Bypass SSL verification for development only
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController caption = TextEditingController();

  File? imagePath;
  String? imageName;
  String? imageData;

  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getImage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagePath = File(getImage!.path);
      imageName = getImage.path.split('/').last;
      imageData = base64Encode(imagePath!.readAsBytesSync());

      print(imagePath);
      print(imageName);
      print(imageData);
    });
  }

  Future<void> uploadImage() async {
    try {
      String uri = "https://10.0.2.2/flutter_image_project/upload_image.php";

      var res = await http.post(Uri.parse(uri), body: {
        "caption": caption.text,
        "name": imageName,
        "data": imageData
      });

      var response = jsonDecode(res.body);

      if (response['success'] == 'true') {
        print('uploaded');
      } else {
        print('issue');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: caption,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('Enter the caption')),
          ),
          const SizedBox(
            height: 20,
          ),
          // ternary operator condition for image path whether choosen or not ---> if imagepath is not null then show image if null then show text
          imagePath != null
              ? Image.file(imagePath!)
              : const Text('Image not choosen yet'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                getImage();
              },
              child: const Text('Choose image')),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  uploadImage();
                });
              },
              child: const Text('Upload')),

          Builder(builder: (context) {
            return ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ViewImage()));
                },
                child: const Text('View Data'));
          })
        ],
      ),
    );
  }
}
