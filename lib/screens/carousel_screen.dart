import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                      return _buildImage(img);
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
                  _dotsIndicator(),
                ],
              ),
      ),
    );
  }

  Widget _dotsIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _activeIndex,
      count: _images!.length,
      effect: const JumpingDotEffect(activeDotColor: Colors.black, dotHeight: 12.0, dotWidth: 12.0, verticalOffset: 8.0),

    );
  }

  Widget _buildImage(XFile image) {
    File img = File(image.path);
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 4,
            
          ),
        ],
      ),
      child: Image.file(
        img,
        fit: BoxFit.fill,
      ),
    );
  }

  Future<void> _pickMultiImages() async {
    final images = await ImagePicker().pickMultiImage();
    _images = images;
    setState(() {});
  }
}
