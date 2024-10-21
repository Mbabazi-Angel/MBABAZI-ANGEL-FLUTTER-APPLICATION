import 'package:flutter/material.dart';

BottomNavigationBar customBottomNavigationBar(
    int selectedIndex, Function(int) onTap) {
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    onTap: onTap,
    selectedItemColor:
        Colors.white, // Change selected icon and label color to white
    unselectedItemColor:
        Colors.grey, // Change unselected icon and label color to grey
    backgroundColor: Colors.black, // Set background color to black
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.video_library),
        label: 'Shorts',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box),
        label: 'Upload',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.subscriptions),
        label: 'Subscriptions',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'You',
      ),
    ],
  );
}
