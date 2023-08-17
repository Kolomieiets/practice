

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:practice_app/services/global/entity/name_data.dart';
import 'package:practice_app/services/storage/storages/image_path_storage.dart';
import 'package:practice_app/services/storage/storages/user_info_storage.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitial()) {
    on<UserInfoInitEvent>(_onInit);
    on<UserInfoPutNameDataEvent>(_onPutNameData);
    on<UserInfoChangeImageEvent>(_changeImage);
    on<UserInfoDeleteFileEvent>(_deleteImage);
  }

  _onInit(UserInfoInitEvent event, Emitter<UserInfoState> emit) async {
    String? path;
    NameData? nameData = await UserInfoStorage().get();

    path = await ImagePathStorage().get();


    emit(UserInfoState(
      nameData: nameData,
      path: path ?? '',
    ));
  }

  _onPutNameData(UserInfoPutNameDataEvent event, Emitter<UserInfoState> emit) {
    emit(state.copyWith(
      nameData: event.nameData,
    ));
    UserInfoStorage().put(event.nameData);
  }

  _changeImage(
      UserInfoChangeImageEvent event, Emitter<UserInfoState> emit) async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    ImagePathStorage storage = ImagePathStorage();

    storage.put(image.path);

    emit(state.copyWith(path: image.path));
  }

  _deleteImage(
      UserInfoDeleteFileEvent event, Emitter<UserInfoState> emit) async {
    ImagePathStorage().delete();
    emit(state.copyWith(path: ''));
  }
}
