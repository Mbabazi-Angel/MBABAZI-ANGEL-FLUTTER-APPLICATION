import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    title: Row(
      children: [
        Image.network(
          'https://goodly.co.in/wp-content/uploads/2023/10/youtube-logo-png-46016.png',
          height: 32.0,
        ),
        const SizedBox(width: 8.0),
        const Text(
          'YouTube',
          style: TextStyle(
            fontFamily: 'Roboto', // Similar font to YouTube's
            fontWeight: FontWeight.w700, // Bold to match the YouTube look
            fontSize: 22.0, // Adjusted font size for YouTube style
            color: Colors.white,
            letterSpacing: -0.5, // Slight letter spacing
          ),
        ),
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
      IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {
          // Action for user profile
        },
      ),
    ],
  );
}
