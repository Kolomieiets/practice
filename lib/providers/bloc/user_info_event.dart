part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoEvent {}

class UserInfoInitEvent extends UserInfoEvent {}

class UserInfoPutNameDataEvent extends UserInfoEvent {
  final NameData nameData;

  UserInfoPutNameDataEvent({
    required this.nameData,
  });
}

class UserInfoChangeImageEvent extends UserInfoEvent {}

class UserInfoDeleteFileEvent extends UserInfoEvent {}
