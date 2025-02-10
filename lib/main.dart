// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_pocket_wallet/classes/homecontent.dart';
import 'package:my_pocket_wallet/firebase_options.dart';
import 'package:my_pocket_wallet/screens/splashscreen.dart'; // Importing the Material package.

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyPocketWallet());
}

// Root widget for the app.
class MyPocketWallet extends StatelessWidget {
  const MyPocketWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Pocket Wallet',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/home': (context) =>  const Homecontent(),
        // Add more routes as needed
      },
    );
  }
}
