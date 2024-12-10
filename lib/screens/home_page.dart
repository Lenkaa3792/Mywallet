import 'package:flutter/material.dart';
import 'withdraw.dart'; // Import the WithdrawScreen

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Good Morning,',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Gega!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Card Section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3C5AFE), Color(0xFF42A5F5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gega Smith',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'OverBridge Expert',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '4756 •••• •••• 9018',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '\$3,469.52',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'VISA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Grid Menu Section
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _buildMenuItem(
                        context, Icons.account_balance_wallet, 'Account\nand Card', null),
                    _buildMenuItem(context, Icons.swap_horiz, 'Transfer', null),
                    _buildMenuItem(context, Icons.attach_money, 'Withdraw',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WithdrawScreen()),
                      );
                    }),
                    _buildMenuItem(context, Icons.phone_android,
                        'Mobile\nrecharge', null),
                    _buildMenuItem(context, Icons.receipt, 'Pay the bill', null),
                    _buildMenuItem(context, Icons.credit_card, 'Credit card', null),
                    _buildMenuItem(context, Icons.insert_chart,
                        'Transaction\nreport', null),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // Menu Item Widget
  Widget _buildMenuItem(BuildContext context, IconData icon, String label,
      VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.withOpacity(0.1),
            child: Icon(icon, color: Colors.blue, size: 30),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
