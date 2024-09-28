import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoopingVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const LoopingVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _LoopingVideoPlayerState createState() => _LoopingVideoPlayerState();
}

class _LoopingVideoPlayerState extends State<LoopingVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Initialize the controller and set it to loop
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..setLooping(true)
      ..setVolume(0.0);

    // Initialize the controller and store the Future for later use
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Start playing the video automatically when the initialization is complete
      _controller.play();
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Video has been initialized, display it
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          // Display a loading spinner while the video is initializing
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
