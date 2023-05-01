import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/widgets/drawer.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  static const String routeName = '/video';
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _firstController;
  ChewieController? _firstChewieController;
  late VideoPlayerController _secondController;
  ChewieController? _secondChewieController;

  @override
  void initState() {
    videoPlayerInit();
    super.initState();
  }

  Future<void> videoPlayerInit() async {
    try {
      _firstController = VideoPlayerController.network(
          'https://upload.wikimedia.org/wikipedia/commons/7/76/Conversation_Hour_for_Human_Rights_Policy_Launch.webm');
      await _firstController.initialize();
      ;
    } catch (error) {
      print('My error => $error');
    }

    _firstChewieController = setChewieController(_firstController);

    try {
      _secondController = VideoPlayerController.network(
          'https://upload.wikimedia.org/wikipedia/commons/4/42/Slow_motion_of_running_greyhound.webm');
      await _secondController.initialize().then((value) {
        _secondChewieController = setChewieController(_secondController);
      });
    } catch (error) {}

    _secondChewieController = setChewieController(_secondController);

    setState(() {});
  }

  ChewieController setChewieController(VideoPlayerController controller) {
    return ChewieController(
        videoPlayerController: controller,
        errorBuilder: (context, errorMessage) {
          return Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.white, size: 100),
                  SizedBox(height: 50),
                  Text('Oops, something went wrong'),
                ],
              ));
        });
  }

  @override
  void dispose() {
    super.dispose();
    _firstController.dispose();
    _firstChewieController!.dispose();
    _secondController.dispose();
    _secondChewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              _firstChewieController != null
                  ? Card(
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Color.fromARGB(255, 242, 240, 240),
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                          aspectRatio: _firstController.value.aspectRatio,
                          child: Chewie(controller: _firstChewieController!),
                        ),
                      ),
                  )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              SizedBox(height: 16),
              _secondChewieController != null
                  ? Card(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Color.fromARGB(255, 242, 240, 240),
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                          aspectRatio: _secondController.value.aspectRatio,
                          child: Chewie(controller: _secondChewieController!),
                        ),
                      ),
                  )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
