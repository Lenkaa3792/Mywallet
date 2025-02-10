import 'package:flutter/material.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card'),
      ),
      body: const Center(
        child: Text('Credit Card Page'),
      ),
    );
  }
}