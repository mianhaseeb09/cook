import 'package:video_player/video_player.dart';

class VideoItem {
  final String id;
  final String videoUrl;
  final String username;
  final String caption;
  final String likes;
  final String comments;
  final String shares;
  bool isLiked;
  bool isSaved;
  late VideoPlayerController controller;

  VideoItem({
    required this.id,
    required this.videoUrl,
    required this.username,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.isLiked,
    this.isSaved = false,

  }) {
    controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        controller.setLooping(true);
      });
  }
  void toggleLike() {
    isLiked = !isLiked;
  }
  void toggleSave() {
    isSaved = !isSaved;
  }

  void dispose() {
    controller.dispose();
  }

}

