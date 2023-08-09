import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/app_urls.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
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
      _firstController = VideoPlayerController.network(AppUrls.horizontalVideo);
      await _firstController.initialize();
      ;
    } catch (error) {
      print('My error => $error');
    }

    _firstChewieController = setChewieController(_firstController);

    try {
      _secondController = VideoPlayerController.network(AppUrls.verticalVideo);
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
              height: AppSizes.h300,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline,
                      color: Colors.white, size: AppSizes.h100),
                  SizedBox(height: AppSizes.h50),
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
    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionaryVideoScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.w8),
          child: Column(
            children: [
              SizedBox(height: AppSizes.h16),
              _firstChewieController != null
                  ? Card(
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.w8, vertical: AppSizes.h8),
                        color: Color.fromARGB(255, 242, 240, 240),
                        height: AppSizes.h300,
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
              SizedBox(height: AppSizes.h16),
              _secondChewieController != null
                  ? Card(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        color: Color.fromARGB(255, 242, 240, 240),
                        height: AppSizes.h300,
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
