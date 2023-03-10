import 'package:flutter/material.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';

class VideosScreen extends StatefulWidget {
  static const String routeName = '/videos';
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Videos')),
        drawer: const MyDrawer(),
        body: const Center(),
      ),
    );
  }
}
