import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/screens/api_requests_screen/components/popup_content.dart';
import 'package:practice_app/screens/api_requests_screen/components/popup_layout.dart';

class DogPhotoPopUp extends StatelessWidget {
  DogPhotoPopUp({super.key});

  String link = '';
  String newUrl = '';

  @override
  Widget build(BuildContext context) {
    return PopUpLayout(
      child: FutureBuilder(
        future: _getDogPhoto(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return PopUpContent(
              child: CachedNetworkImage(
                imageUrl: newUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Column(
                  children: [
                    Icon(Icons.error, size: 60, color: Colors.grey,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Oops, something goes wrong! Please try again later'),
                    ),
                  ],
                ),
              ),
              buttonText: 'Good boy',
              sharingText: 'Look what a cool dog I found! $newUrl',
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Future<void> _getDogPhoto() async {
    Uri url = Uri.parse('https://dog.ceo/api/breeds/image/random');
    http.Response response = await http.get(url);
    link = response.body;
    if (response.statusCode == 200) {
      List<String> list = link.split('"');
      newUrl = list[3].replaceAll("\\", '');
    } else {
      throw Exception('Failed to load photo');
    }
  }
}
