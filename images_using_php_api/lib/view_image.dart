import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewImage extends StatefulWidget {
  const ViewImage({super.key});

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  List record = [];

  Future<void> getImage() async {
    String uri = "http://10.0.2.2/flutter_image_project/view_image.php";

    try {
      var res = await http.get(Uri.parse(uri));

      setState(() {
        record = jsonDecode(res.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // to get instant images when the function class is called
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Image From MySQL'),
      ),
      body: GridView.builder(
        itemCount: record.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                    child: Expanded(
                  child: Image.network(
                      "http://10.0.2.2/flutter_image_project/" +
                          record[index]['image_path']),
                )),
                Container(
                  child: Text(record[index]['caption']),
                )
                // Image.Network()
              ],
            ),
          );
        },
      ),
    );
  }
}
