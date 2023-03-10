import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_app/widgets/drawer.dart';

class ChangeInfoScreen extends StatefulWidget {
  static const String routeName = '/change_info';
  const ChangeInfoScreen({super.key});

  @override
  State<ChangeInfoScreen> createState() => _ChangeInfoScreenState();
}

class _ChangeInfoScreenState extends State<ChangeInfoScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();

  @override
  void initState() {
    _setDataToControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change your information'),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            height: 300.0,
            color: Colors.red,
          ),
          SizedBox(height: 32.0),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextFormField(
            controller: _surnameController,
            decoration: InputDecoration(hintText: 'Surname'),
          ),
          ElevatedButton(onPressed: _changeInfo, child: Text('Save'))
        ],
      ),
    );
  }

  void _changeInfo() async {
    final String key = 'user_info';
    LazyBox<dynamic> _userInfo = await Hive.openLazyBox(key);
    await _userInfo.put(key, _getDataFromFields);
    await _userInfo.close();
  }

  void _setDataToControllers() async {
    final String key = 'user_info';
    LazyBox<dynamic> userInfo = await Hive.openLazyBox(key);
    var json = await userInfo.get(key);
    Map<String, dynamic> data = Map<String, dynamic>.from(json);
    await userInfo.close();
    
    _nameController.text = data['name'] ?? '';
    _surnameController.text = data['surname'] ?? '';
  }

  Map<String, String> get _getDataFromFields {
    return {
      'name': _nameController.text,
      'surname': _surnameController.text,
    };
  }
}
