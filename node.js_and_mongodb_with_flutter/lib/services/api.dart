import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.100.148/api/";

  static addProduct(Map pdata) async {
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final response = await http.post(url, body: pdata);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        print('Data Added Successfuly');
      } else {
        print('Failed to get response');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
