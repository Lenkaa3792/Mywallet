import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController customAmountController = TextEditingController();
  String selectedMethod = 'Visa ****1234';
  String phoneNumber = '+8564757899';
  int selectedAmount = 100;

  void _showTransactionPopup(String amount) {
    final now = DateTime.now();
    final formattedDate = "${now.day}-${now.month}-${now.year}";
    final formattedTime = "${now.hour}:${now.minute}";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Transaction Receipt'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Date: $formattedDate"),
              Text("Time: $formattedTime"),
              Text("Method: $selectedMethod"),
              Text("Amount: \$$amount"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the popup
              },
              child: const Text('Okay'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrintPage(
                      date: formattedDate,
                      time: formattedTime,
                      method: selectedMethod,
                      amount: amount,
                    ),
                  ),
                );
              },
              child: const Text('Print'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate back
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Illustration
            Center(
              child: Image.network(
                'https://media.gettyimages.com/id/1206893520/vector/transfer-money.jpg?s=1024x1024&w=gi&k=20&c=1H_BrzxnKr5qoc2JymVFbtqemviBE16gFi7uLz1qTkk=',
                height: 200,
                width: 850,
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown for payment method
            DropdownButtonFormField<String>(
              value: selectedMethod,
              items: const [
                DropdownMenuItem(value: 'Visa ****1234', child: Text('Visa ****1234')),
                DropdownMenuItem(value: 'Mpesa', child: Text('Mpesa')),
                DropdownMenuItem(value: 'PayPal', child: Text('PayPal')),
                DropdownMenuItem(value: 'Stripe', child: Text('Stripe')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Payment Method',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Phone number display
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                phoneNumber,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),

            // Choose amount
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose amount',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Amount buttons
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ...[10, 50, 100, 150, 200].map((amount) {
                  return ChoiceChip(
                    label: Text('\$$amount'),
                    selected: selectedAmount == amount,
                    onSelected: (isSelected) {
                      setState(() {
                        selectedAmount = amount;
                        customAmountController.clear();
                      });
                    },
                  );
                }),
                ChoiceChip(
                  label: const Text('Other'),
                  selected: selectedAmount == 0,
                  onSelected: (isSelected) {
                    setState(() {
                      selectedAmount = 0;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Custom amount input
            if (selectedAmount == 0)
              TextField(
                controller: customAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter custom amount',
                  border: OutlineInputBorder(),
                ),
              ),
            const SizedBox(height: 24),

            // Verify button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String amount = selectedAmount > 0
                      ? selectedAmount.toString()
                      : customAmountController.text.trim();

                  if (amount.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter an amount')),
                    );
                    return;
                  }

                  _showTransactionPopup(amount);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Withdraw'),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class PrintPage extends StatelessWidget {
  final String date;
  final String time;
  final String method;
  final String amount;

  const PrintPage({
    Key? key,
    required this.date,
    required this.time,
    required this.method,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print Receipt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date: $date"),
            Text("Time: $time"),
            Text("Method: $method"),
            Text("Amount: \$$amount"),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add print logic here
                },
                child: const Text('Print Receipt'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
