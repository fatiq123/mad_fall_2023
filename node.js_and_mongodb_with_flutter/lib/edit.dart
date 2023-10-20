import 'package:flutter/material.dart';
import 'package:nodejs_backend_with_flutter/model/product.dart';
import 'package:nodejs_backend_with_flutter/services/api.dart';

class EditScreen extends StatefulWidget {
  final Product data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState() {
    // when ever the edit screen is called it instantly get data from Product object
    super.initState();
    name.text = widget.data.name.toString();
    price.text = widget.data.price.toString();
    description.text = widget.data.description.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          TextField(
            controller: price,
            decoration: const InputDecoration(hintText: 'Price'),
          ),
          TextField(
            controller: description,
            decoration: const InputDecoration(hintText: 'Description'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Api.updateProduct(widget.data.id, {
                "pname": name.text,
                "pprice": price.text,
                "pdescription": description.text,
                "id": widget.data.id
              });
            },
            child: const Text('Update Data'),
          )
        ],
      ),
    );
  }
}
