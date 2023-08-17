import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/change_info_screen/components/name_text_fields.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:practice_app/services/global/state_manager/bloc/user_info_bloc/user_info_bloc.dart';

@RoutePage()
class ChangeInfoScreen extends StatefulWidget {
  static const String routeName = '/change_info';
  const ChangeInfoScreen({super.key});

  @override
  State<ChangeInfoScreen> createState() => _ChangeInfoScreenState();
}

class _ChangeInfoScreenState extends State<ChangeInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionaryChangeInfoScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            BlocBuilder<UserInfoBloc, UserInfoState>(
              builder: (context, state) {
                return Container(
                  height: AppSizes.h300,
                  width: AppSizes.h300,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.h300),
                    color: Colors.grey,
                  ),
                  child: state.path.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Image.asset(
                            'assets/images/avatar.png',
                            fit: BoxFit.cover,
                            color: Colors.white,
                          ),
                        )
                      : Image(
                          fit: BoxFit.cover,
                          image: FileImage(File(state.path)),
                        ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<UserInfoBloc>(context)
                        .add(UserInfoChangeImageEvent());
                  },
                  child: Text(
                    DictionaryManager
                        .instance.dictionaryChangeInfoScreen.buttonChangeImage,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<UserInfoBloc>(context)
                        .add(UserInfoDeleteFileEvent());
                  },
                  child: Text(
                    DictionaryManager
                        .instance.dictionaryChangeInfoScreen.buttonDeleteImage,
                  ),
                )
              ],
            ),
            SizedBox(height: AppSizes.h32),
            NameTextFields(),
          ],
        ),
      ),
    );
  }
}
