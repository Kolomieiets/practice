import 'package:flutter/widgets.dart';
import 'package:practice_app/services/global/entity/items_for_shimmer_loading.dart';
import 'package:practice_app/presentation/screens/shimmer_loading_screen/shimmer_loading_screen.dart';

mixin ItemList<T extends StatefulWidget> on State<ShimmerLoadingScreen> {
List<LoadingItems> info = [
    LoadingItems(
      url: 'https://picsum.photos/seed/picsum/200/300',
      title: 'Static Random Image',
      description:
          'Get the same random image every time based on a seed, by adding /seed/{seed} to the start of the url.',
    ),
    LoadingItems(
      url: 'https://picsum.photos/id/237/200/300',
      title: 'Specific Image',
      description:
          'Get a specific image by adding /id/{image} to the start of the url.',
    ),
    LoadingItems(
      url: 'https://picsum.photos/200/300/?blur',
      title: 'Blur',
      description:
          'Get a blurred image by appending ?blur to the end of the url.',
    ),
    LoadingItems(
      url: 'https://picsum.photos/200/300?grayscale',
      title: 'Grayscale',
      description:
          'Get a grayscale image by appending ?grayscale to the end of the url.',
    ),
  ];

  Future<void> pullRefresh() async {
    info = info.reversed.toList();
    setState(() {});
  }
}

