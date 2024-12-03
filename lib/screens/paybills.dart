import 'package:flutter/material.dart';

// PayBillsPage widget for the Pay Bills screen.
class PayBillsPage extends StatefulWidget {
  const PayBillsPage({super.key});

  @override
  _PayBillsPageState createState() => _PayBillsPageState();
}

class _PayBillsPageState extends State<PayBillsPage> {
  String biller = '';  // Store the selected biller.
  double amount = 0.0;  // Store the bill payment amount.
  String paymentMethod = ''; // Store the selected payment method.

  // Function to confirm the bill payment.
  void _confirmPayment() {
    if (biller.isNotEmpty && amount > 0 && paymentMethod.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentConfirmationPage(
            biller: biller,
            amount: amount,
            paymentMethod: paymentMethod,
          ),
        ),
      );
    } else {
      // Show an error if any field is empty.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay Bills')),  // AppBar with page title.
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding around the content.
        child: Column(
          children: [
            // Biller input field
            TextField(
              decoration: const InputDecoration(labelText: 'Biller'),  // Label for biller field.
              onChanged: (value) {
                setState(() {
                  biller = value;  // Update biller name when text changes.
                });
              },
            ),
            const SizedBox(height: 16),  // Spacer between input fields.

            // Amount input field
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),  // Label for amount field.
              keyboardType: TextInputType.number,  // Only allows numeric input.
              onChanged: (value) {
                setState(() {
                  amount = double.tryParse(value) ?? 0.0;  // Update amount if valid.
                });
              },
            ),
            const SizedBox(height: 16),  // Spacer between input fields.

            // Payment method dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Payment Method'),  // Label for the dropdown.
              value: paymentMethod.isEmpty ? null : paymentMethod,  // Set initial value.
              items: const [
                // Dropdown items for payment methods.
                DropdownMenuItem(
                  value: 'Bank Account',
                  child: Text('Bank Account'),
                ),
                DropdownMenuItem(
                  value: 'Mobile Wallet',
                  child: Text('Mobile Wallet'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  paymentMethod = value ?? '';  // Update selected payment method.
                });
              },
            ),
            const SizedBox(height: 16),  // Spacer between input fields.

            // Proceed button to confirm payment
            ElevatedButton(
              onPressed: _confirmPayment,  // Trigger confirmation when pressed.
              child: const Text('Proceed to Confirm'),  // Button text.
            ),
          ],
        ),
      ),
    );
  }
}

// PaymentConfirmationPage widget for confirming bill payment.
class PaymentConfirmationPage extends StatelessWidget {
  final String biller;
  final double amount;
  final String paymentMethod;

  // Constructor to receive payment details.
  const PaymentConfirmationPage({
    Key? key,
    required this.biller,
    required this.amount,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Payment')),  // AppBar with title.
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding around the content.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Align content to left.
          children: [
            const Text('Payment Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),  // Heading text.
            const SizedBox(height: 16),  // Spacer between heading and content.
            Text('Biller: $biller'),  // Display biller info.
            Text('Amount: \$${amount.toStringAsFixed(2)}'),  // Display amount with two decimals.
            Text('Payment Method: $paymentMethod'),  // Display payment method.
            const SizedBox(height: 20),  // Spacer before buttons.

            // Confirm Button to process the payment
            ElevatedButton(
              onPressed: () {
                // Process the payment (e.g., send request to backend).
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Payment Successful')),  // Success message.
                );
                Navigator.popUntil(context, (route) => route.isFirst);  // Go back to the Dashboard.
              },
              child: const Text('Confirm Payment'),  // Button text.
            ),
            const SizedBox(height: 10),  // Spacer between buttons.

            // Cancel Button to go back to the Pay Bills page
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // Go back to the Pay Bills page.
              },
              child: const Text('Cancel'),  // Button text.
            ),
          ],
        ),
      ),
    );
  }
}
