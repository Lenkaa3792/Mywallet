import 'package:flutter/material.dart';
import 'package:my_pocket_wallet/classes/homecontent.dart';
import 'package:my_pocket_wallet/classes/messages.dart';
import 'package:my_pocket_wallet/classes/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const Homecontent(),
    const MessagesScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFFFFDFF), // Background color

          body: _pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
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
          )),
    );
  }

}
