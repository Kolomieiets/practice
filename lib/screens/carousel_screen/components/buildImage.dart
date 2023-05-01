import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuildImage extends StatelessWidget {
  final XFile image;

  const BuildImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    final File img = File(image.path);
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
}
