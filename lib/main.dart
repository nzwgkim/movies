import 'package:flutter/material.dart';
import 'package:movies/src/provider/bottom_navigation_provider.dart';
import 'package:movies/src/provider/counter_provider.dart';
import 'package:movies/src/provider/movie_provider.dart';
import 'package:movies/src/ui/home.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VideoApp(),
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider<CounterProvider>(
      //       create: (_) => CounterProvider(),
      //     ),
      //     ChangeNotifierProvider<BottomNavigationProvider>(
      //       create: (_) => BottomNavigationProvider(),
      //     ),
      //     ChangeNotifierProvider<MovieProvider>(
      //       create: (_) => MovieProvider(),
      //     ),
      //   ],
      //   child: Home(),
      // ),
    );
  }
}

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
