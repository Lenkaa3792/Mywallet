import 'package:flutter/material.dart';

// SendMoneyPage widget for the Send Money screen.
class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  String recipient = '';  // Store the recipient's details (name or number).
  double amount = 0.0;     // Store the amount to send.
  String paymentMethod = ''; // Store the selected payment method.

  // Function to confirm the transaction and navigate to confirmation page.
  void _confirmTransaction() {
    // If all fields are filled, navigate to the confirmation page.
    if (recipient.isNotEmpty && amount > 0 && paymentMethod.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransactionConfirmationPage(
            recipient: recipient,
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
      appBar: AppBar(title: const Text('Send Money')),  // AppBar with page title.
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding around the main content.
        child: Column(
          children: [
            // Recipient input field
            TextField(
              decoration: const InputDecoration(labelText: 'Recipient'),  // Label for the recipient field.
              onChanged: (value) {
                setState(() {
                  recipient = value;  // Update recipient value when text changes.
                });
              },
            ),
            const SizedBox(height: 16),  // Spacer between input fields.

            // Amount input field
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),  // Label for the amount field.
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
              decoration: const InputDecoration(labelText: 'Payment Method'),  // Label for the dropdown field.
              value: paymentMethod.isEmpty ? null : paymentMethod,  // Set the initial value.
              items: const [
                // Dropdown items for selecting payment method.
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
                  paymentMethod = value ?? '';  // Update the payment method on selection.
                });
              },
            ),
            const SizedBox(height: 16),  // Spacer between input fields.

            // Proceed button to confirm transaction
            ElevatedButton(
              onPressed: _confirmTransaction,  // Trigger confirmation when pressed.
              child: const Text('Proceed to Confirm'),  // Button text.
            ),
          ],
        ),
      ),
    );
  }
}

// TransactionConfirmationPage widget for displaying and confirming the transaction details.
class TransactionConfirmationPage extends StatelessWidget {
  final String recipient;
  final double amount;
  final String paymentMethod;

  // Constructor to receive the transaction details.
  const TransactionConfirmationPage({
    Key? key,
    required this.recipient,
    required this.amount,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Transaction')),  // AppBar with page title.
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding around the content.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Align content to the left.
          children: [
            const Text('Transaction Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),  // Heading text.
            const SizedBox(height: 16),  // Spacer between heading and content.
            Text('Recipient: $recipient'),  // Display recipient info.
            Text('Amount: \$${amount.toStringAsFixed(2)}'),  // Display amount with two decimals.
            Text('Payment Method: $paymentMethod'),  // Display selected payment method.
            const SizedBox(height: 20),  // Spacer before buttons.

            // Confirm Button to process the transaction
            ElevatedButton(
              onPressed: () {
                // Process the transaction (e.g., send request to backend).
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Transaction Successful')),  // Success message.
                );
                Navigator.popUntil(context, (route) => route.isFirst);  // Navigate back to the Dashboard.
              },
              child: const Text('Confirm and Send'),  // Button text.
            ),
            const SizedBox(height: 10),  // Spacer between buttons.

            // Cancel Button to go back to the Send Money page
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // Go back to the Send Money page.
              },
              child: const Text('Cancel'),  // Button text.
            ),
          ],
        ),
      ),
    );
  }
}
