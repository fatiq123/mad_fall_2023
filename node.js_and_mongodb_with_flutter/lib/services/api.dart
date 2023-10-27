import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nodejs_backend_with_flutter/model/product.dart';

class Api {
  static const baseUrl = "http://192.168.100.148/api/";
  // static const baseUrl = "http://10.5.116.180/api/";

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

  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse("${baseUrl}get_product"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<Product> products = jsonData.map((data) {
        print(data);
        return Product(
          id: data['_id'],
          name: data['pname'],
          price: data['pprice'],
          description: data['pdescription'],
        );
      }).toList();
      print(products[0]);
      return products;
    } else {
      throw Exception('Failed to load products');
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

  //       print(response.body);

  //       // traverse to full list using foreach loop to get every product data
  //       data['products'].forEach(
  //         (value) => productData.add(
  //           Product(
  //             id: value['id'],
  //             name: value['pname'],
  //             price: value['pprice'],
  //             description: value['pdescription'],
  //           ),
  //         ),
  //       );

  //       print('----------------------------$productData----------------------------');

  //       print(data);
  //       print('Data fetched successfuly');

  //       return productData;
  //     } else {
  //       print('Failed to get response');
  //       return []; // return an empty list if statusCode is not 200
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // static Future<List<Product>> getProduct() async {
  //   List<Product> productData = [];

  //   try {
  //     final url = Uri.parse("${baseUrl}get_product");
  //     var response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);

  //       // Traverse the list of products and add them to the productData list
  //       for (var value in data['products']) {
  //         productData.add(
  //           Product(
  //             name: value['pname'],
  //             price: value['pprice'],
  //             description: value['pdescription'],
  //             id: value['id'].toString(),
  //           ),
  //         );
  //       }

  //       print('Data fetched successfully');
  //       return productData;
  //     } else {
  //       print('Failed to get a 200 status code');
  //       return []; // Return an empty list if the status code is not 200
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     return []; // Return an empty list on error
  //   }
  // }

  // function to update record
  // static updateProduct(id, body) async {
  //   try {
  //     final url = Uri.parse(baseUrl + "update_product/$id");
  //     var response = await http.post(url, body: body);
  //     if (response.statusCode == 200) {
  //       print(jsonDecode(response.body));
  //       print('product updated successfuly');
  //     } else {
  //       print('Failed to update Data');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
/////////////////////////////
  // static Future<void> updateProduct(
  //     String id, Map<String, dynamic> body) async {
  //   try {
  //     if (id == null) {
  //       print('Invalid id: $id');
  //       return; // Exit early if id is null
  //     }

  //     final url = Uri.parse(baseUrl + "update_product/$id");
  //     final response = await http.put(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(body),
  //     );

  //     print('Response status code: ${response.statusCode}');
  //     print('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       final responseData = jsonDecode(response.body);
  //       print(responseData);
  //       print('Product updated successfully');
  //     } else {
  //       if (response.statusCode == 400) {
  //         final responseData = jsonDecode(response.body);
  //         print(responseData);
  //         print('Failed to update product: ${responseData["message"]}');
  //       } else {
  //         print('Failed to update product');
  //       }
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  static Future<void> updateProduct(
      String id, Map<String, dynamic> body) async {
    try {
      if (id == null || id.isEmpty) {
        print('Invalid id: $id');
        return; // Exit early if id is invalid
      }

      final url = Uri.parse("${baseUrl}update_product/$id");
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('Product updated successfully');
      } else {
        print('Failed to update product');
      }
    } catch (e) {
      print(e.toString());
    }
  }

//==========================================delete

  // // function to delete record
  // static deleteProduct(id) async {
  //   try {
  //     final url = Uri.parse(baseUrl + "delete_product/$id");
  //     var response = await http.post(url);

  //     if (response.statusCode == 200) {
  //       print(jsonDecode(response.body));
  //     } else {
  //       print('Failed to delete record');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  static Future<void> deleteProduct(String id) async {
    try {
      if (id == null || id.isEmpty) {
        print('Invalid id: $id');
        return; // Exit early if id is invalid
      }

      final url = Uri.parse("${baseUrl}delete_product/$id");
      final response = await http.delete(url); // Use DELETE request

      if (response.statusCode == 200) {
        print('Product deleted successfully');
      } else {
        print('Failed to delete product');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // static Future<bool> deleteProduct(id) async {
  //   try {
  //     final url = Uri.parse(baseUrl + "delete_product/$id");
  //     var response = await http.post(url);

  //     if (response.statusCode == 200) {
  //       print(jsonDecode(response.body));
  //       return true; // Deletion was successful
  //     } else if (response.statusCode == 404) {
  //       print('Product not found');
  //       return false; // Product not found
  //     } else {
  //       print('Failed to delete record. Status code: ${response.statusCode}');
  //       return false; // Deletion failed
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     return false; // Deletion failed
  //   }
  // }
}
