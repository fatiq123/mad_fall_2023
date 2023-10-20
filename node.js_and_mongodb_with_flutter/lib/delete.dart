import 'package:flutter/material.dart';

import 'model/product.dart';
import 'services/api.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Product'),
      ),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data available.'),
            );
          } else {
            List<Product> pdata = snapshot.data;

            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("${pdata[index].name}"),
                  subtitle: Text("${pdata[index].description}"),
                  trailing: IconButton(
                    onPressed: () async {
                      await Api.deleteProduct(pdata[index].id);
                      pdata.removeAt(index);

                      setState(() {});
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  // trailing: IconButton(
                  //   onPressed: () async {
                  //     Api.deleteProduct(pdata[index].id);
                  //     pdata.removeAt(index);
                  //     setState(() {});
                  //   },
                  //   icon: const Icon(Icons.delete),
                  // ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
