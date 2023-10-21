import 'package:flutter/material.dart';
import 'package:nodejs_backend_with_flutter/model/product.dart';
import 'package:nodejs_backend_with_flutter/services/api.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetched Data'),
      ),
      // body: FutureBuilder<List<Product>>(
      //   future: Api.getProduct(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text('Error: ${snapshot.error}'),
      //       );
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return const Center(
      //         child: Text('No data available.'),
      //       );
      //     } else {
      //       List<Product>? pdata = snapshot.data;

      //       return ListView.builder(
      //         itemCount: pdata!.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             leading: const Icon(Icons.storage),
      //             title: Text("${pdata[index].name}"),
      //             subtitle: Text("${pdata[index].description}"),
      //             trailing: Text("\$ ${pdata[index].price}"),
      //           );
      //         },
      //       );
      //     }
      //   },
      // ),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> pdata = snapshot.data;
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("${pdata[index].name}"),
                  subtitle: Text("${pdata[index].description}"),
                  trailing: Text("\$ ${pdata[index].price}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
