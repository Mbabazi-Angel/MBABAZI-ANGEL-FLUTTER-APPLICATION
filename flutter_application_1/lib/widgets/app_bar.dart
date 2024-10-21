import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    title: Row(
      children: [
        Image.network(
          'https://goodly.co.in/wp-content/uploads/2023/10/youtube-logo-png-46016.png', // Replace with your network image URL
          height: 32.0,
        ),
        const SizedBox(width: 8.0),
        const Text('YouTube'),
      ],
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  );
}
