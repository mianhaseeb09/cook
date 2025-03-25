import 'package:flutter/material.dart';
import '../models/video_model.dart';
import '../services/video_player.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  final PageController _pageController = PageController();
  final List<VideoItem> _videos = [
    VideoItem(
      id: '1',
      videoUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      username: 'Layla Mohsina',
      caption: 'This is my first TikTok video! #fyp #viral',
      likes: '124.5K',
      comments: '1.2K',
      shares: '5.7K',
      isLiked: false,
    ),
    VideoItem(
      id: '2',
      videoUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      username: '@creator2',
      caption: 'Check out this cool trick! #trending',
      likes: '876.3K',
      comments: '24.5K',
      shares: '89.2K',
      isLiked: true,
    ),
    VideoItem(
      id: '3',
      videoUrl:
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      username: '@creator2',
      caption: 'Check out this cool trick! #trending',
      likes: '876.3K',
      comments: '24.5K',
      shares: '89.2K',
      isLiked: true,
    ),
    VideoItem(
      id: '4',
      videoUrl:
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      username: '@creator2',
      caption: 'Check out this cool trick! #trending',
      likes: '876.3K',
      comments: '24.5K',
      shares: '89.2K',
      isLiked: true,
    ),
    // Add more videos
  ];

  @override
  void dispose() {
    _pageController.dispose();
    for (var video in _videos) {
      video.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          return VideoPlayerWidget(video: _videos[index]);
        },
      ),
    );
  }
}




