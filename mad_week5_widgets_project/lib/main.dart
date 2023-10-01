import 'package:flutter/material.dart';
import 'package:mad_week5_widgets_project/screens/selection_screen.dart';
import 'package:mad_week5_widgets_project/styles/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SelectionScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets App", textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          children: [
            // Lottie.asset("assets/animations/flutter_lotie.json",
            //     fit: BoxFit.cover, reverse: true, repeat: true),
            OutlinedButton(
              style: buttonPrimary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectionScreen(),
                  ),
                );
              },
              child: const Text("Stateless Widgets"),
            ),
            const SizedBox(height: 100,),
            ElevatedButton(
              style: buttonPrimary,
              onPressed: () {},
              child: const Text("Stateful Widgets"),
            )
          ],
        ),
      ),
    );
  }
}
