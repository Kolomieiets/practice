import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practice_app/get_it/get_it.dart';
import 'package:practice_app/layouts/buttons_screen_layout.dart';
import 'package:practice_app/notifications_service/notofication_service.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(title: const Text('My first app')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to my first app!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32.0),
              ButtonsScreenLayout(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      getIt<NotificationService>().showNotifications(
                        title: 'Reminder',
                        body: 'You are perfect',
                      );
                    },
                    child: Text('Show notification'),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              Text('You can leave a rating for my app',
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
              SizedBox(height: 32.0),
              RatingBar(
                glow: false,
                initialRating: 3,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: Icon(
                    Icons.star,
                    color: Colors.green,
                  ),
                  half: Icon(
                    Icons.star_half,
                    color: Colors.green,
                  ),
                  empty: Icon(
                    Icons.star_border,
                    color: Colors.green,
                  ),
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
