import 'package:flutter/material.dart';
import 'package:practice_app/objects/monobank_user.dart';
import 'package:practice_app/screens/monobank_ui/components/my_animated_appbar.dart';
import 'package:practice_app/screens/monobank_ui/components/persistent_header.dart';
import 'package:practice_app/screens/monobank_ui/components/user_info.dart';
import 'package:practice_app/screens/monobank_ui/components/user_item_builder.dart';
import 'package:practice_app/screens/monobank_ui/components/users_list.dart';

class UiMonobankListScreen extends StatefulWidget {
  static const String routeName = '/ui_monobank_list';
  const UiMonobankListScreen({super.key});

  @override
  State<UiMonobankListScreen> createState() => _UiMonobankListScreenState();
}

class _UiMonobankListScreenState extends State<UiMonobankListScreen> {
  List<UserInfo> users = [];
  bool _isFirst = false;

  @override
  void initState() {
    _makeUsersList();
    _sortList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            pinned: true,
            delegate: MyAnimatedAppBar(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                String id = users[index].id;
                _checkFirst(index);
                _setColor(index);
                return UserItemBuilder(id, index, users, _isFirst);
              },
              childCount: UsersList.users.length
            ),
          ),
        ],
      ),
    );
  }

  void _makeUsersList() {
    List<MonobankUser> pastUsers = UsersList.users;

    for (int i = 0; i < pastUsers.length; ++i) {
      String title;
      String? name = pastUsers[i].name;
      String? surname = pastUsers[i].surname;

      if (name == null && surname == null) {
        title = pastUsers[i].phoneNumber;
      } else if (name != null && surname == null) {
        title = name;
      } else if (name == null && surname != null) {
        title = surname;
      } else {
        title = '${name} ${surname}';
      }

      users.add(UserInfo(
        title: title,
        id: pastUsers[i].id,
      ));
    }
  }

  void _sortList() {
    users.sort((a, b) => a.title.compareTo(b.title));
  }

  void _checkFirst(int i) {
    if (i != 0 && users[i].title.startsWith(users[i - 1].title[0])) {
      _isFirst = false;
    } else {
      _isFirst = true;
    }
  }

  void _setColor(int i) {
    if (_isFirst) {
      if (i == 0) {
        users[i].color = Colors.blue;
      } else if (users[i - 1].color == Colors.blue) {
        users[i].color = Colors.purple;
      } else if (users[i - 1].color == Colors.purple) {
        users[i].color = Colors.pink;
      } else if (users[i - 1].color == Colors.pink) {
        users[i].color = Colors.blue;
      }
    } else {
      users[i].color = users[i - 1].color;
    }
  }
}
