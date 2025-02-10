import 'package:flutter/material.dart';

class PayTheBillPage extends StatelessWidget {
  const PayTheBillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay the Bill'),
      ),
      body: const Center(
        child: Text('Pay the Bill Page'),
      ),
    );
  }
}