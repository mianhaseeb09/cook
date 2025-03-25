
import 'package:flutter/material.dart';

import '../models/video_model.dart';

class FeedController  extends ChangeNotifier {
  final List<VideoItem > _videos = [];
  int _currentIndex = 0;

  List<VideoItem > get videos => _videos;
  int get currentIndex => _currentIndex;

  void loadSampleVideos() {
    _videos.addAll([
      VideoItem (
        id: '1',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        username: 'Layla Mohsin',
        caption: 'This is my first TikTok video! #fyp #viral',
        likes: '124.5K',
        comments: '1.2K',
        shares: '5.7K', isLiked: false,
      ),
      VideoItem (
        id: '2',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        username: '@creator2',
        caption: 'Check out this cool trick! #trending',
        likes: '876.3K',
        comments: '24.5K',
        shares: '89.2K',
        isLiked: true,
      ),
    ]);
    notifyListeners();
  }

  void changeVideoIndex(int index) {
    _currentIndex = index;
  }
  void toggleSave(String videoId) {
    final video = _videos.firstWhere((v) => v.id == videoId);
    video.toggleSave();
    notifyListeners();
    // Call API to update save status
    _updateSaveOnServer(videoId, video.isSaved);
  }
  Future<void> _updateLikeOnServer(String videoId, bool isLiked) async {
    // Implement actual API call
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> _updateSaveOnServer(String videoId, bool isSaved) async {
    // Implement actual API call
    await Future.delayed(const Duration(milliseconds: 300));
  }
  void dispose() {
    for (var video in _videos) {
      video.dispose();
    }
  }
}
