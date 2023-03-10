import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatFactPopUp extends StatefulWidget {
  const CatFactPopUp({super.key});

  @override
  State<CatFactPopUp> createState() => _CatFactPopUpState();
}

class _CatFactPopUpState extends State<CatFactPopUp> {
  Map<String, dynamic> fact = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: FutureBuilder(
            future: _getCatFact(),
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
                      Text('Interesting cat fact'),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0, top: 8.0, right: 32.0, left: 32.0),
                        child: Text(fact['fact']),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('It was interesting'),
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

  Future<void> _getCatFact() async {
    Uri url = Uri.parse('https://catfact.ninja/fact');
    http.Response response = await http.get(url);
    fact = jsonDecode(response.body);
  }
}
