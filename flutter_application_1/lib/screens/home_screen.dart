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
  String selectedCategory = 'Home'; // Start with the Home page

  final List<String> categories = ['Home', 'ASMR', 'Sitcoms', 'Music'];

  // Video data for each category
  final Map<String, List<Map<String, String>>> categoryVideos = {
    'Home': [
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1506702315536-dd8b83e2dcf9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
        'channelAvatar': 'https://randomuser.me/api/portraits/men/1.jpg',
        'videoTitle': 'Exploring Nature',
        'channelName': 'Nature Channel',
        'views': '1.5M'
      },
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1721332155433-3a4b5446bcd9?w=500&auto=format&fit=crop&q=60',
        'channelAvatar': 'https://randomuser.me/api/portraits/women/2.jpg',
        'videoTitle': 'Cityscape Timelapse',
        'channelName': 'Urban Views',
        'views': '2.3M'
      },
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
        'channelAvatar': 'https://randomuser.me/api/portraits/men/3.jpg',
        'videoTitle': 'Tech Review 2024',
        'channelName': 'Tech Reviews',
        'views': '500K'
      },
    ],
    'ASMR': [
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1506702315536-dd8b83e2dcf9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
        'channelAvatar': 'https://randomuser.me/api/portraits/men/4.jpg',
        'videoTitle': 'ASMR for Sleep',
        'channelName': 'Relax Sounds',
        'views': '3.1M'
      },
    ],
    'Sitcoms': [
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1721332155433-3a4b5446bcd9?w=500&auto=format&fit=crop&q=60',
        'channelAvatar': 'https://randomuser.me/api/portraits/women/5.jpg',
        'videoTitle': 'Best Sitcom Moments',
        'channelName': 'Comedy Central',
        'views': '4.5M'
      },
    ],
    'Music': [
      {
        'imageUrl':
            'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
        'channelAvatar': 'https://randomuser.me/api/portraits/men/6.jpg',
        'videoTitle': 'Top 10 Music Hits',
        'channelName': 'Music World',
        'views': '6M'
      },
    ],
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  Widget _buildCategoryBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;
          return GestureDetector(
            onTap: () => _onCategorySelected(category),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Display content based on selected bottom navigation category
  Widget _buildBodyContent() {
    if (_selectedIndex == 0) {
      // Home category with category videos
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryBar(), // category bar for Home
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: categoryVideos[selectedCategory]!
                    .map((video) => VideoCard(
                          imageUrl: video['imageUrl']!,
                          channelAvatar: video['channelAvatar']!,
                          videoTitle: video['videoTitle']!,
                          channelName: video['channelName']!,
                          views: video['views']!,
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      );
    } else if (_selectedIndex == 1) {
      // Shorts page content
      return const Center(child: Text('Shorts Page'));
    } else if (_selectedIndex == 2) {
      // Subscriptions page content
      return const Center(child: Text('Subscriptions Page'));
    } else if (_selectedIndex == 3) {
      // Upload page content
      return const Center(child: Text('Upload Page'));
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: _buildBodyContent(), // Call _buildBodyContent() based on selection
      bottomNavigationBar:
          customBottomNavigationBar(_selectedIndex, _onItemTapped),
    );
  }
}
