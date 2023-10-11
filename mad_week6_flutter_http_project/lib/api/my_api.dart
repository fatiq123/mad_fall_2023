import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CRUD Example'),
        ),
        body: CRUDExample(),
      ),
    );
  }
}

class CRUDExample extends StatefulWidget {
  @override
  _CRUDExampleState createState() => _CRUDExampleState();
}

class _CRUDExampleState extends State<CRUDExample> {
  String operationResult = "";
  String enteredData = "";
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: textController,
            decoration: InputDecoration(labelText: 'Enter Data'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                enteredData = textController.text;
                textController.clear();
              });
            },
            child: Text('Add Data'),
          ),
          ElevatedButton(
            onPressed: () {
              // You can display the entered data when the "Read" button is clicked
              setState(() {
                operationResult = "Entered Data: $enteredData";
              });
            },
            child: Text('Read Data'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement your update functionality here
              setState(() {
                operationResult = "Update Data: $enteredData"; // Example message
              });
            },
            child: Text('Update Data'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement your delete functionality here
              setState(() {
                operationResult = "Deleted Data: $enteredData"; // Example message
              });
            },
            child: Text('Delete Data'),
          ),
          Text(operationResult),
        ],
      ),
    );
  }
}