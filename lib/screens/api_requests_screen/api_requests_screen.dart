import 'package:flutter/material.dart';
import 'package:practice_app/layouts/buttons_screen_layout.dart';
import 'package:practice_app/screens/api_requests_screen/components/cat_fact_popup.dart';
import 'package:practice_app/screens/api_requests_screen/components/dog_photo_popup.dart';
import 'package:practice_app/widgets/drawer.dart';

class ApiRequestsScreen extends StatefulWidget {
  static const String routeName = '/api_requests';
  ApiRequestsScreen({super.key});

  @override
  State<ApiRequestsScreen> createState() => _ApiRequestsScreenState();
}

class _ApiRequestsScreenState extends State<ApiRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Requests'),
      ),
      drawer: MyDrawer(),
      body: ButtonsScreenLayout(
        children: [
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CatFactPopUp();
                  },
                );
              },
              child: Text('Random fact about cats'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DogPhotoPopUp();
                  });
            },
            child: Text('Random dogs photo'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Translator'),
          ),
        ],
      ),
    );
  }
}
