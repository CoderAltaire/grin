import 'package:grin/core/routes/imports.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  // Kinescope external_url (video manzili)
  final String videoUrl =
      'https://kinescope.io/gdHnvFBkviJvxaXwWhXawP/master.m3u8';

  // Kinescope'dan olingan token (misol uchun)
  final String token = HiveBoxes.acces_token.get("acces_token") ?? "null";

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    // Token bilan HTTP header beramiz
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
      httpHeaders: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
    );

    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("token == $token");

    return Scaffold(
      appBar: AppBar(title: const Text('Kinescope Video Player')),
      body: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : const CircularProgressIndicator(),
      ),
    );
  }
}
