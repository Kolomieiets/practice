import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberConfirmationContent extends StatelessWidget {
  const NumberConfirmationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      RichText(
        text: TextSpan(
          text:
              '${DictionaryManager.instance.dictionaryTelegramScreen.updateNumber} ',
          style: TextStyle(
            color: AppTextStyle.colorGrey,
          ),
          children: [
            TextSpan(
              text: DictionaryManager
                  .instance.dictionaryTelegramScreen.learn_more,
              style: TextStyle(color: AppTextStyle.colorDarkBlue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _openLink('www.lipsum.com/');
                },
            ),
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
