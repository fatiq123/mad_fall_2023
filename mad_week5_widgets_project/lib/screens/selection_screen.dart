import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../styles/button.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/animations/flutter_lotie.json",
                      fit: BoxFit.cover, reverse: true, repeat: true, width: 250, height: 250),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {},
                    child: const Text("Stateful Widgets"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
