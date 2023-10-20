import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nodejs_backend_with_flutter/model/product.dart';

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

  // static getProduct() async {
  //   List<Product> productData =
  //       []; // to store product data in list which if of type class

  //   try {
  //     final url = Uri.parse("${baseUrl}get_product");

  //     var response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);

  //       // traverse to full list using foreach loop to get every product data
  //       data['products'].forEach(
  //         (value) => productData.add(
  //           Product(
  //             name: value['pname'],
  //             price: value['pprice'],
  //             description: value['pdescription'],
  //           ),
  //         ),
  //       );

  //       print(data);
  //       print('Data fetched successfuly');

  //       return productData;
  //     } else {
  //       print('Failed to get response');
  //       return [];  // return an empty list if statusCode is not 200
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }


  static Future<List<Product>> getProduct() async {
  List<Product> productData = [];

  try {
    final url = Uri.parse("${baseUrl}get_product");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // Traverse the list of products and add them to the productData list
      for (var value in data['products']) {
        productData.add(
          Product(
            name: value['pname'],
            price: value['pprice'],
            description: value['pdescription'],
          ),
        );
      }

      print('Data fetched successfully');
      return productData;
    } else {
      print('Failed to get a 200 status code');
      return []; // Return an empty list if the status code is not 200
    }
  } catch (e) {
    print(e.toString());
    return []; // Return an empty list on error
  }
}

}
