import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PopUpContent extends StatelessWidget {
  final String? title;
  final Widget child;
  final String buttonText;
  final String sharingText;
  const PopUpContent(
      {this.title, required this.child, required this.buttonText, required this.sharingText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.clear),
              ),
            ],
          ),
          Text(title ?? ''),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 32.0, top: 8.0, right: 32.0, left: 32.0),
            child: child,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(buttonText),
              ),
              ElevatedButton(
                onPressed: () {
                  Share.share(
                      sharingText);
                },
                child: Icon(Icons.share),
              ),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
