import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const VideoListScreen(), // Display Video List on Home
    const Center(child: Text('Shorts')), // Placeholder for Shorts
    const Center(child: Text('Upload')), // Placeholder for Upload
    const Center(child: Text('Subscriptions')), // Placeholder for Subscriptions
    const Center(child: Text('You')), // Placeholder for User Account
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar:
          customBottomNavigationBar(_selectedIndex, _onItemTapped),
    );
  }
}

// New widget for the video list screen
class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          VideoCard(
            imageUrl:
                'https://images.unsplash.com/photo-1506702315536-dd8b83e2dcf9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
            channelAvatar: 'https://randomuser.me/api/portraits/men/1.jpg',
            videoTitle: 'Exploring Nature',
            channelName: 'Nature Channel',
            views: '1.5M',
          ),
          VideoCard(
            imageUrl:
                'https://images.unsplash.com/photo-1721332155433-3a4b5446bcd9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw3MXx8fGVufDB8fHx8fA%3D%3D',
            channelAvatar: 'https://randomuser.me/api/portraits/women/2.jpg',
            videoTitle: 'Cityscape Timelapse',
            channelName: 'Urban Views',
            views: '2.3M',
          ),
          VideoCard(
            imageUrl:
                'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
            channelAvatar: 'https://randomuser.me/api/portraits/men/3.jpg',
            videoTitle: 'Tech Review 2024',
            channelName: 'Tech Reviews',
            views: '500K',
          ),
          VideoCard(
            imageUrl:
                'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
            channelAvatar: 'https://randomuser.me/api/portraits/men/3.jpg',
            videoTitle: 'Tech Review 2024',
            channelName: 'Tech Reviews',
            views: '500K',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
