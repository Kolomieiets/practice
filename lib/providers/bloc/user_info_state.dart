part of 'user_info_bloc.dart';

@immutable
class UserInfoState {
  final NameData? nameData;
  final String path;

  UserInfoState({
   this.nameData, this.path = ''});

  UserInfoState copyWith({
    final NameData? nameData,
    final String? path,
  }) {
    return UserInfoState(
      nameData: nameData ?? this.nameData,
      path: path ?? this.path,
    );
  }
}

class UserInfoInitial extends UserInfoState {}
