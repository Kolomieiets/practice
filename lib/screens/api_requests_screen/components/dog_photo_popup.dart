import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DogPhotoPopUp extends StatefulWidget {
  const DogPhotoPopUp({super.key});

  @override
  State<DogPhotoPopUp> createState() => _DogPhotoPopUpState();
}

class _DogPhotoPopUpState extends State<DogPhotoPopUp> {
  String link = '';
  String newUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: FutureBuilder(
            future: _getDogPhoto(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
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
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 32.0, top: 8.0, right: 32.0, left: 32.0),
                        child: Image.network(newUrl),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Good boy'),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator(color: Colors.white);
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getDogPhoto() async {
    Uri url = Uri.parse('https://dog.ceo/api/breeds/image/random');
    http.Response response = await http.get(url);
    link = response.body;
    List<String> list = link.split('"');
    newUrl = list[3].replaceAll("\\", '');
  }
}
