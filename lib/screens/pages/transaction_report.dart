import 'package:flutter/material.dart';

class TransactionReportPage extends StatelessWidget {
  const TransactionReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Report'),
      ),
      body: const Center(
        child: Text('Transaction Report Page'),
      ),
    );
  }
}