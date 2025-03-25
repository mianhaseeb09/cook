import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../models/video_model.dart';
import '../screens/get_Other_User_profile_Screen.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoItem video;

  const VideoPlayerWidget({super.key, required this.video});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  bool _showHeart = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video Player
        VisibilityDetector(
          key: Key(widget.video.id),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.8) {
              widget.video.controller.play();
            } else {
              widget.video.controller.pause();
            }
          },
          child: SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: widget.video.controller.value.size.width,
                height: widget.video.controller.value.size.height,
                child: VideoPlayer(widget.video.controller),
              ),
            ),
          ),
        ),

        // Video Overlay
        Positioned.fill(
          child: Column(
            children: [
              const Spacer(),
              // Bottom info
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GetOtherUserProfileScreen()),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(
                                'https://s3-alpha-sig.figma.com/img/7c3a/fa00/1e3e23379e3842d3d05705a6bd52fd71?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=lgpgGgoGC~sifg3E1QfQMW1GFSLZ7isNCuo7CDAOdUe-z6rc1Bufwk7DaUc1JHJs2S3xfqf-jc2BAWqANhMHPK0TfH4Vsb8xVr1aAyxc25BIcA1sEK5dAgtHqVo14y8MZlAM9nkl~hLIrwZWJ9ZRCv87FvZttQkRz-PteT~WMWrYiyDUguFVKwr08jpBJGg3nbtoGQqLIRZFiyZ0tdYjBQ9D846r3nvKXUZYFuvCPYYcAE6wU2I-WWpSOk51zpREkAt87djXZcITJ1C4l36d5t4lV0vInTiI3NtWIdqs4V7jznwoKoL-ragVQEFOZ7JzQnFD5IVKpDCMIhmODwjZfA__'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.video.username,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 1, // Border width
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Center(
                                child: Text(
                              "Follow",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400),
                            )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.video.caption,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        // Right side action buttons
        Positioned(
          right: 16,
          bottom: 80,
          child: Column(
            children: [
              _buildActionButton(
                icon: widget.video.isLiked ? Icons.favorite : Icons.favorite,
                count: widget.video.likes,
                isActive: widget.video.isLiked,
                onPressed: _toggleLike,
              ),
              const SizedBox(height: 24),
              _buildActionButton(
                icon: Icons.comment,
                count: widget.video.comments,
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              _buildActionButton(
                icon: Icons.share,
                count: widget.video.shares,
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShef6cCBnW_qNjepzjGqxUZ9Su-X9oZbIyXw&s',
                ),
              ),
            ],
          ),
        ),

        // Like animation
        if (_showHeart)
          const Positioned.fill(
            child: Center(
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 120,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String count,
    bool isActive = false,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: isActive ? Colors.red : Colors.white,
            size: 32,
          ),
          onPressed: onPressed,
        ),
        Text(
          count,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }

  void _toggleLike() {
    setState(() {
      widget.video.isLiked = !widget.video.isLiked;
      if (widget.video.isLiked) {
        _showHeart = true;
        Future.delayed(const Duration(milliseconds: 800), () {
          if (mounted) setState(() => _showHeart = false);
        });
      }
    });
  }
}
