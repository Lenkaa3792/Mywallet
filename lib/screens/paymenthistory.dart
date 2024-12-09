import 'package:flutter/material.dart';
import 'package:my_pocket_wallet/screens/maindashboard.dart';

class PaymentHistoryPage extends StatefulWidget {
  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Tabs Section
              Container(
                color: Colors.blue.withOpacity(0.1),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Electric'),
                    Tab(text: 'Water'),
                    Tab(text: 'Internet'),
                  ],
                ),
              ),
              // Payment Cards Section
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildPaymentHistoryList('Electric'),
                    _buildPaymentHistoryList('Water'),
                    _buildPaymentHistoryList('Internet'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DashboardPage()),
          );
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
            icon: Icon(Icons.message),
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

  Widget _buildPaymentHistoryList(String category) {
    final List<Map<String, dynamic>> paymentHistory = [
      {
        'month': 'Jan',
        'date': '12',
        'status': 'Paid',
        'amount': '\$45.00',
        'company': 'Power Corp',
      },
      {
        'month': 'Feb',
        'date': '20',
        'status': 'Pending',
        'amount': '\$60.00',
        'company': 'Power Corp',
      },
    ];

    return ListView.builder(
      itemCount: paymentHistory.length,
      itemBuilder: (context, index) {
        final payment = paymentHistory[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.withOpacity(0.2),
              child:
                  Text(payment['month'], style: TextStyle(color: Colors.blue)),
            ),
            title: Text(payment['company']),
            subtitle: Text('${payment['date']} - ${payment['status']}'),
            trailing: Text(payment['amount'],
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }
}
