import 'package:flutter/material.dart';
import 'package:nodejs_backend_with_flutter/services/api.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
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
            ElevatedButton(onPressed: () {
              var data = {
                "pname": name.text,
                "pprice": price.text,
                "pdescription": description.text
              };
              // added map top function addProduct which also requires a map
              Api.addProduct(data);
            }, child: const Text('Create Data'))
          ],
        ),
      ),
    );
  }
}
