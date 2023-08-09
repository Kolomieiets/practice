class DictionaryDialogs {
  late final String _catFactTitle;
  late final String _catFactCloseDialog;
  late final String _catFactShare;
  late final String _dogPhotoCloseDialog;
  late final String _dogPhotoShare;
  late final String _geolocationTitle;
  late final String _geolocationShare;
  late final String _logoutTitle;
  late final String _resetPassword;
  late final String _ok;

  DictionaryDialogs({required Map<String, String> dialogs}) {
    _catFactTitle = dialogs['cat_fact_title'] ?? '';
    _catFactCloseDialog = dialogs['cat_fact_close_dialog'] ?? '';
    _catFactShare = dialogs['cat_fact_share'] ?? '';
    _dogPhotoCloseDialog = dialogs['dog_photo_close_dialog'] ?? '';
    _dogPhotoShare = dialogs['dog_photo_share'] ?? '';
    _geolocationTitle = dialogs['geolocation_title'] ?? '';
    _geolocationShare = dialogs['geolocation_share'] ?? '';
    _logoutTitle = dialogs['logout_title'] ?? '';
    _resetPassword = dialogs['reset_password'] ?? '';
    _ok = dialogs['ok'] ?? '';
  }

  String get catFactTitle => _catFactTitle;
  String get catFactCloseDialog => _catFactCloseDialog;
  String get catFactShare => _catFactShare;
  String get dogPhotoCloseDialog => _dogPhotoCloseDialog;
  String get dogPhotoShare => _dogPhotoShare;
  String get geolocationTitle => _geolocationTitle;
  String get geolocationShare => _geolocationShare;
  String get logoutTitle => _logoutTitle;
  String get resetPassword => _resetPassword;
  String get ok => _ok;
}
