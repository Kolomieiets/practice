
import 'package:url_launcher/url_launcher.dart';

mixin Launchers{
  
  Future<void> phoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  Future<void> sms(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> email(String email) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{'subject': '', 'body': ''}),
    );
    await launchUrl(launchUri);
  }

  Future<void> linkInBrowser(String link) async {
    final Uri url = Uri(
      scheme: 'https',
      path: link,
    );
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> linkInApp(String link) async {
    final Uri url = Uri(
      scheme: 'https',
      path: link,
    );
    await launchUrl(
      url,
    );
  }
}