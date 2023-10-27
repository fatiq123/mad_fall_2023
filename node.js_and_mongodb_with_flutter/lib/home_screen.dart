import 'package:flutter/material.dart';
import 'package:nodejs_backend_with_flutter/create.dart';
import 'package:nodejs_backend_with_flutter/delete.dart';
import 'package:nodejs_backend_with_flutter/fetch_data.dart';
import 'package:nodejs_backend_with_flutter/update.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('node.js and mongodb'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateData(),
                    ));
              },
              child: const Text('CREATE'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FetchData(),
                    ));
              },
              child: const Text('READ'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateScreen(),
                    ));
              },
              child: const Text('UPDATE'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeleteScreen(),
                    ));
              },
              child: const Text('DELETE'),
            ),
          ],
        ),
      ),
    );
  }
}
