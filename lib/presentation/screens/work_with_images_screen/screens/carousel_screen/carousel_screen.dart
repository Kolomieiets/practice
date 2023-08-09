import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_app/presentation/screens/work_with_images_screen/screens/carousel_screen/components/buildImage.dart';
import 'package:practice_app/presentation/screens/work_with_images_screen/screens/carousel_screen/components/dots_indicator.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class CarouselScreen extends StatefulWidget {
  static const String routeName = '/carousel';
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  List<XFile>? _images;
  int _activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionaryWorkWithImagesScreen.title,
        ),
      ),
      body: Center(
        child: _images == null
            ? SizedBox(
                width: AppSizes.w200,
                child: ElevatedButton(
                  onPressed: () {
                    _pickMultiImages();
                  },
                  child: Text(
                    DictionaryManager
                        .instance.dictionaryWorkWithImagesScreen.makeCarousel,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    itemCount: _images!.length,
                    itemBuilder: (context, index, realIndex) {
                      final img = _images![index];
                      return BuildImage(img);
                    },
                    options: CarouselOptions(
                      height: AppSizes.h400,
                      clipBehavior: Clip.none,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        _activeIndex = index;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(height: AppSizes.h32),
                  DotsIndicator(
                    activeIndex: _activeIndex,
                    images: _images,
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _pickMultiImages() async {
    final images = await ImagePicker().pickMultiImage();
    if (images.isEmpty) {
      setState(() {});
      return;
    }
    _images = images;
    setState(() {});
  }
}
