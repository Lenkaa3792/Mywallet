import 'package:flutter/material.dart';
import 'package:my_pocket_wallet/screens/loginscreen.dart';
import 'package:my_pocket_wallet/screens/maindashboard.dart';
import 'package:my_pocket_wallet/screens/signgin.dart';

// ForgotPasswordPage widget for the login screen.
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Input your email below"),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Kindly check your email to get the OTP send"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Send'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
