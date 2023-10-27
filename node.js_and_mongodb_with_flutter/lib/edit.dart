import 'package:flutter/material.dart';
import 'package:nodejs_backend_with_flutter/model/product.dart';
import 'package:nodejs_backend_with_flutter/services/api.dart';

class EditScreen extends StatefulWidget {
  final Product data;

  const EditScreen({Key? key, required this.data}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name ?? '';
    priceController.text = widget.data.price ?? '';
    descriptionController.text = widget.data.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedData = {
                  'pname': nameController.text,
                  'pprice': priceController.text,
                  'pdescription': descriptionController.text,
                };
                print(
                    'Product ID: ${widget.data.id} '); // Add this line for debugging
                await Api.updateProduct(widget.data.id ?? '', updatedData);
                Navigator.of(context).pop();
              },
              child: Text('Update Product'),
            ),
          ],
        ),
      ),
    );
  }
}
