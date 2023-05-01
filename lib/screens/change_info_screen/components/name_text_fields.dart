import 'package:flutter/material.dart';
import 'package:practice_app/providers/user_info_provider.dart';
import 'package:provider/provider.dart';

class NameTextFields extends StatefulWidget {
  const NameTextFields({super.key});

  @override
  State<NameTextFields> createState() => _NameTextFieldsState();
}

class _NameTextFieldsState extends State<NameTextFields> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();

  // @override
  // void initState() {
  //   Provider.of<UserInfoProvider>(context).getNameData();
  //   super.initState();
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text =
        Provider.of<UserInfoProvider>(context).nameData['name'] ?? '';
    _surnameController.text =
        Provider.of<UserInfoProvider>(context).nameData['surname'] ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextFormField(
            controller: _surnameController,
            decoration: InputDecoration(hintText: 'Surname'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Provider.of<UserInfoProvider>(context, listen: false).putNameData(
                name: _nameController.text,
                surname: _surnameController.text,
              );
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
