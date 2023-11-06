import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showCustomFullScreenModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: [
              // Curved design at the top with a yellow background
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  color: Colors.yellow, // Yellow background color
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      50,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 40),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            /* style: ElevatedButton.styleFrom(
                              primary: Colors.yellow,
                            ),*/
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 40, left: 70),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // White card at the bottom
              Positioned(
                top: MediaQuery.of(context).size.height * 0.17,
                left: 16,
                right: 16,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Lottie.asset(
                          "assets/animations/signin.json",
                          fit: BoxFit.cover,
                          reverse: true,
                          repeat: true,
                          width: 250,
                          height: 250,
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        const Text(
                          'Note: This is a new app launched in November 2023, not the app with the same name that has been removed from the Google Play. Please pay attention!',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            // Your button action goes here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                28.0,
                              ), // Adjust the border radius as needed
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/search.png',
                                  height: 30,
                                  width: 30,
                                ),
                                const Text(
                                  'Sign In With Google',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'By logging in,you agree to Privacy Policy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black26,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Terms of Use',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.yellow[300],
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.yellow[300],
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Full-Screen Modal Bottom Sheet Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showCustomFullScreenModal(
                context); // Call the function to show the custom full-screen modal sheet.
          },
          child: const Text('Show Custom Full-Screen Modal Bottom Sheet'),
        ),
      ),
    );
  }
}
