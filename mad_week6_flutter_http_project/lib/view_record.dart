import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mad_week6_flutter_http_project/update_record.dart';

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

  Future<void> deleteRecord(String id) async {
    try {
      String uri = 'http://10.0.2.2/practice/delete_record.php';

      var res = await http.post(Uri.parse(uri), body: {"id": id});
      var response = jsonDecode(res.body);

      if (response['success'] == 'true') {
        print('record deleted');
        getRecord(); // to update the list when record is deleted
        Fluttertoast.showToast(
            msg: "Record Deleted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        print('error');
      }
    } catch (e) {
      print(e);
    }
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
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    deleteRecord(userData[index]['id']);
                  },
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => UpdateRecord(
                      userData[index]["name"],
                      userData[index]["email"],
                      userData[index]["password"]
                    )),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
