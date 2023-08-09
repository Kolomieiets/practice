class DictionaryWorkWithImagesScreen{
  late final String _title;
  late final String _changeAvatar;
  late final String _makeCarousel;
  late final String _changeImage;
  late final String _imageChanged;
  late final String _gallery;
  late final String _camera;

  DictionaryWorkWithImagesScreen({required Map<String, String> workWithImagesScreen}) {
    _title = workWithImagesScreen['title'] ?? '';
    _changeAvatar = workWithImagesScreen['change_avatar'] ?? '';
    _makeCarousel = workWithImagesScreen['make_carousel'] ?? '';
    _changeImage = workWithImagesScreen['change_image'] ?? '';
    _imageChanged = workWithImagesScreen['image_changed'] ?? '';
    _gallery = workWithImagesScreen['gallery'] ?? '';
    _camera = workWithImagesScreen['camera'] ?? '';
  }
  String get title => _title;
  String get changeAvatar => _changeAvatar;
  String get makeCarousel => _makeCarousel;
  String get changeImage => _changeImage;
  String get imageChanged => _imageChanged;
  String get gallery => _gallery;
  String get camera => _camera;
}