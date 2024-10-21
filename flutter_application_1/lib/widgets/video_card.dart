import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String imageUrl;
  final String channelAvatar;
  final String videoTitle;
  final String channelName;
  final String views;

  const VideoCard({
    super.key,
    required this.imageUrl,
    required this.channelAvatar,
    required this.videoTitle,
    required this.channelName,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 50); // Error handling
              },
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(channelAvatar),
            ),
            title: Text(videoTitle,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('$channelName • $views views'),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Replica'),
      ),
      body: const SingleChildScrollView(
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
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
