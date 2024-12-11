// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_pocket_wallet/screens/splashscreen.dart'; // Importing the Material package.

void main() {
  runApp(const MyPocketWallet());
}

// Root widget for the app.
class MyPocketWallet extends StatelessWidget {
  const MyPocketWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caslang  Wallet',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  Splashscreen(), // Initial screen.
    );
  }
}



