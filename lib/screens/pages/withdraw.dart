import 'package:flutter/material.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw'),
      ),
      body: const Center(
        child: Text('Withdraw Page'),
      ),
    );
  }
}