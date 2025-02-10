import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  int _currentPage = 0; // Tracks the current screen (0, 1, or 2)
  final TextEditingController _searchController = TextEditingController();
  String recipientName = 'Jane Cooper';
  String amount = '\$320.00';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToNextPage() {
    setState(() {
      if (_currentPage < 2) {
        _currentPage++;
      }
    });
  }

  void _navigateToPreviousPage() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _navigateToPreviousPage,
              )
            : null,
      ),
      body: _buildPage(_currentPage),
    );
  }

  Widget _buildPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return _buildSearchScreen();
      case 1:
        return _buildConfirmationScreen();
      case 2:
        return _buildSuccessScreen();
      default:
        return const Center(child: Text('Invalid page'));
    }
  }

  // First Screen: Search for recipient
  Widget _buildSearchScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transfer money to',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Write name, phone or card number',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Simulate searching for a recipient
                  setState(() {
                    recipientName = 'Jane Cooper'; // Example recipient
                  });
                  _navigateToNextPage();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Second Screen: Confirmation screen
  Widget _buildConfirmationScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transfer money to',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              recipientName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Amount: $amount',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: _navigateToNextPage,
              child: const Text(
                'Send',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Third Screen: Success screen
  Widget _buildSuccessScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 80,
          ),
          const SizedBox(height: 20),
          Text(
            '$amount has been sent to $recipientName!',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Reset to the first screen
              setState(() {
                _currentPage = 0;
              });
            },
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
