import 'package:flutter/material.dart';
import 'package:practice_app/layouts/buttons_screen_layout.dart';
import 'package:practice_app/resources/app_contacts.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:practice_app/resources/app_links.dart';

class UrlLauncherScreen extends StatelessWidget {
  static const String routeName = '/url_launcher';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Url launcher'),
          ),
          drawer: const MyDrawer(),
          body: ButtonsScreenLayout(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _phoneCall(AppContacts.phoneNumber);
                  },
                  child: const Text('Call')),
              ElevatedButton(
                  onPressed: () {
                    _sms(AppContacts.phoneNumber);
                  },
                  child: const Text('SMS')),
              ElevatedButton(
                  onPressed: () {
                    _email(AppContacts.email);
                  },
                  child: const Text('E-mail')),
              ElevatedButton(
                  onPressed: () {
                    _linkInApp(AppLinks.site);
                  },
                  child: const Text('URL in app')),
              ElevatedButton(
                  onPressed: () {
                    _linkInBrowser(AppLinks.site2);
                  },
                  child: const Text('URL in browser')),
            ],
          )),
    );
  }

  Future<void> _phoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  Future<void> _sms(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _email(String email) async {
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

  Future<void> _linkInBrowser(String link) async {
    final Uri url = Uri(
      scheme: 'https',
      path: link,
    );
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _linkInApp(String link) async {
    final Uri url = Uri(
      scheme: 'https',
      path: link,
    );
    await launchUrl(
      url,
    );
  }
}
