import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/items_list.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberConfirmationContent extends StatelessWidget {
  const NumberConfirmationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      RichText(
        text: TextSpan(
          text:
              'Keep your number up to date to ensure you can always log into Telegram.',
          style: TextStyle(color: Colors.grey),
          children: [
            TextSpan(
              text: 'Learn more',
              style: TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _openLink('www.lipsum.com/');
                },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _openLink(String link) async {
    final Uri url = Uri(
      scheme: 'https',
      path: link,
    );
    await launchUrl(
      url,
    );
  }
}
