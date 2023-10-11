// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// // get request
// Future<Album> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
//
// // post request
// Future<Album> createAlbum(String title, String body) async {
//   Map<String, dynamic> request = {
//     'title': title,
//     'body': body,
//     'userId': "111"
//   };
//
//   final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//   final response = await http.post(uri, body: request);
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
//
// // update api request
// Future<Album> updateAlbum(String title, String body) async {
//   Map<String, dynamic> request = {
//     'id': "101",
//     'title': title,
//     'body': body,
//     'userId': "111"
//   };
//
//   final uri = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
//   final response = await http.put(uri, body: request);
//
//   if (response.statusCode == 200) {
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
//
// // delete api request
// Future<Album?>? deleteAlbum() async {
//   final uri = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
//   final response = await http.delete(uri);
//
//   if (response.statusCode == 200) {
//     return null;
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
//
// class Album {
//   final int userId;
//   final int id;
//   final String title;
//
//   const Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // late Future<Album> futureAlbum;
//   Future<Album?>? album;
//
//   @override
//   void initState() {
//     super.initState();
//     album = fetchAlbum();
//   }
//
//   void clickGetButton() {
//     setState(() {
//       album = fetchAlbum();
//     });
//   }
//
//   void clickDeleteButton() {
//     setState(() {
//       album = deleteAlbum();
//     });
//   }
//
//   void clickPostButton() {
//     setState(() {
//       album = createAlbum("top post", "This is an example of post");
//     });
//   }
//
//   void clickUpdateButton() {
//     setState(() {
//       album = updateAlbum("updated post", "This is an example of updated post");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Center(
//           child: Text("Http Example"),
//         ),
//       ),
//       body: SizedBox(
//         height: 500,
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             FutureBuilder(
//               future: album,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 } else if (snapshot.connectionState == ConnectionState.none) {
//                   return Container();
//                 } else {
//                   if (snapshot.hasData) {
//                     return buildDataWidget(context, snapshot);
//                   } else if (snapshot.hasError) {
//                     return Text("${snapshot.error}");
//                   } else {
//                     return Container();
//                   }
//                 }
//               },
//             ),
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 onPressed: () => clickPostButton(),
//                 child: const Text("Post"),
//               ),
//             ),
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 onPressed: () => clickGetButton(),
//                 child: const Text("Get"),
//               ),
//             ),
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 onPressed: () => clickUpdateButton(),
//                 child: const Text("Update"),
//               ),
//             ),
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 onPressed: () => clickDeleteButton(),
//                 child: const Text("Delete"),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildDataWidget(context, snapshot) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(15),
//           child: Text(snapshot.data!.title),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8),
//           child: Text(snapshot.data!.description),
//         )
//       ],
//     );
//   }
//
// /*@override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Album>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data!.title);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//
//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }*/
// }
