import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/presentation/dialogs/dialog_manager.dart';
import 'package:practice_app/presentation/dialogs/dialogs/logout_dialog.dart';
import 'package:practice_app/providers/bloc/user_info_bloc.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:practice_app/services/global/entity/name_data.dart';

class NameTextFields extends StatefulWidget {
  const NameTextFields({super.key});

  @override
  State<NameTextFields> createState() => _NameTextFieldsState();
}

class _NameTextFieldsState extends State<NameTextFields> {
  final NameData nameData = NameData();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
          child: Column(
            children: [
              TextFormField(
                initialValue: state.nameData?.name,
                decoration: InputDecoration(
                  hintText: DictionaryManager
                      .instance.dictionaryChangeInfoScreen.nameField,
                ),
                onChanged: (value) => nameData.name = value,
              ),
              TextFormField(
                initialValue: state.nameData?.surname,
                decoration: InputDecoration(
                  hintText: DictionaryManager
                      .instance.dictionaryChangeInfoScreen.surnameField,
                ),
                onChanged: (value) => nameData.surname = value,
              ),
              SizedBox(height: AppSizes.h16),
              SizedBox(
                width: AppSizes.h150,
                child: ElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (nameData.name == null) {
                      nameData.name = state.nameData?.name;
                    }
                    if (nameData.surname == null) {
                      nameData.surname = state.nameData?.surname;
                    }
                    BlocProvider.of<UserInfoBloc>(context)
                        .add(UserInfoPutNameDataEvent(nameData: nameData));
                  },
                  child: Text(
                    DictionaryManager
                        .instance.dictionaryChangeInfoScreen.buttonSave,
                  ),
                ),
              ),
              SizedBox(
                width: AppSizes.h150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    DialogManager.instance.show(
                      context: context,
                      child: LogoutDialog(),
                    );
                  },
                  child: Text(
                    DictionaryManager
                        .instance.dictionaryChangeInfoScreen.buttonSignout,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
