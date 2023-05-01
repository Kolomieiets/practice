import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_app/screens/carousel_screen/components/buildImage.dart';
import 'package:practice_app/screens/carousel_screen/components/dots_indicator.dart';

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
      appBar: AppBar(title: const Text('Work with images')),
      body: Center(
        child: _images == null
            ? SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    _pickMultiImages();
                  },
                  child: const Text('Make carousel'),
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
                      height: 400,
                      clipBehavior: Clip.none,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        _activeIndex = index;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  DotsIndicator(activeIndex: _activeIndex, images: _images,),
                ],
              ),
      ),
    );
  }


  Future<void> _pickMultiImages() async {
    final images = await ImagePicker().pickMultiImage();
    _images = images;
    setState(() {});
  }
}
