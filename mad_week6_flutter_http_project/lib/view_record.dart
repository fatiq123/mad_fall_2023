import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ViewRecord extends StatefulWidget {
  const ViewRecord({super.key});

  @override
  State<ViewRecord> createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  List userData = [];

  Future<void> getRecord() async {
    String uri = 'http://10.0.2.2/practice/view_record.php';

    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        userData = jsonDecode(response.body); // to refresh continuously
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getRecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Record'),
      ),
      body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(userData[index]["name"]),
                subtitle: Text(userData[index]["email"]),
              ),
            );
          }),
    );
  }
}
