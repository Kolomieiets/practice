// import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:practice_app/screens/api_requests_screen/components/api.dart';
import 'package:practice_app/screens/api_requests_screen/components/popup_content.dart';
import 'package:practice_app/screens/api_requests_screen/components/popup_layout.dart';

class CatFactPopUp extends StatelessWidget {
  CatFactPopUp({super.key});

  Map<String, dynamic> fact = {};
  // final dio = Dio();
  final api = Api();

  @override
  Widget build(BuildContext context) {
    return PopUpLayout(
      child: FutureBuilder(
        future: getApiData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return PopUpContent(
              child: Text(fact['fact'] == null
                  ? 'Oops something goes wrong... Please try again later'
                  : fact['fact']),
              buttonText: 'It was interesting',
              sharingText:
                  'Look what a cool fact about cat I found! ${fact['fact']}',
              title: 'Interesting cat fact!',
            );
          } else {
            return CircularProgressIndicator(color: Colors.white);
          }
        },
      ),
    );
  }

  Future<void> getApiData() async {
    fact = await api.request();
  }

  // Future<void> _request() async {
  //   Response response;
  //   response = await dio.get('https://catfact.ninja/fact');

  //   if (response.statusCode == 200) {
  //     fact = response.data;
  //   } else {
  //     throw Exception('Failed to load fact(');
  //   }
  // }

  // Future<void> _getCatFact() async {
  //   Uri url = Uri.parse('https://catfact.ninja/fact');
  //   http.Response response = await http.get(url);
  //   print('response body => ${response.body}');

  //   if (response.statusCode == 200) {
  //     fact = jsonDecode(response.body);
  //   } else {
  //     throw Exception('Failed to load fact(');
  //   }
  // }
}
