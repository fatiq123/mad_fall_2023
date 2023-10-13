import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertRecord() async {
    if (name.text != '' || email.text != '' || password.text != '') {

      try {
        String uri = 'http://localhost/practice/insert_record.php';

        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "email": email.text,
          "password": password.text
        });
        
        var response = jsonDecode(res.body);
        if (response['success'] == 'true') {
          print('Success. Record Inserted!');
        } else {
          print('Error!');
        }

      } catch(e) {
        print(e);
      }

    } else {
      print('Please Fill the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Record'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter your name')
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter your email')
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: password,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter your password')
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(onPressed: () {
              insertRecord();
            }, child: const Text('Insert'))
          ),
        ],
      ),
    );
  }
}
