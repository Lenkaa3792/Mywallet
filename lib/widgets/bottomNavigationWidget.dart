import 'package:flutter/material.dart';

Widget bottomNavigationBar() {
  return BottomNavigationBar(
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
  );
}
