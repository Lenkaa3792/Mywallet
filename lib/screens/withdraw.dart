import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw Funds'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Amount Input Field
            const Text(
              'Enter Amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter amount to withdraw',
              ),
            ),
            const SizedBox(height: 16),

            // Payment Method Dropdown
            const Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Bank', child: Text('Bank Transfer')),
                DropdownMenuItem(value: 'Mpesa', child: Text('Mpesa')),
                DropdownMenuItem(value: 'PayPal', child: Text('PayPal')),
                DropdownMenuItem(value: 'Stripe', child: Text('Stripe'))
              ],
              onChanged: (value) {
                // Handle selection change
                print('Selected Payment Method: $value');
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select a method',
              ),
            ),
            const SizedBox(height: 24),

            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the withdrawal process
                  final String amount = amountController.text.trim();
                  if (amount.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter an amount')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Processing withdrawal of \$$amount'),
                      ),
                    );
                    // Add your withdrawal logic here
                  }
                },
                child: const Text('Confirm Withdrawal'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
