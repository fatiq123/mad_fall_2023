import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class UpdateRecord extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  const UpdateRecord(this.name, this.email, this.password, {super.key});

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> updateRecord() async {
    try {
      String uri = 'http://10.0.2.2/practice/update_record.php';

      var res = await http.post(Uri.parse(uri), body: {
        "name": name.text,
        "email": email.text,
        "password": password.text
      });

      var response = jsonDecode(res.body);

      if (response["success"] == "true") {
        print('Record Updated');
        Fluttertoast.showToast(
            msg: "Record Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        print('Error');
      }
    } catch (e) {
      print(e);
    }
  }

  // this function is used to get values from view_record file
  @override
  void initState() {
    name.text = widget.name;
    email.text = widget.email;
    password.text = widget.password;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Record'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Enter your name')),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter your email'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter your password'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                updateRecord();
              },
              child: const Text('Update'),
            ),
          ),
        ],
      ),
    );
  }
}
