// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:practice_app/config/auto_router.dart' as _i3;
import 'package:practice_app/presentation/dialogs/dialog_manager.dart' as _i5;
import 'package:practice_app/services/authentication/authentication.dart'
    as _i4;
import 'package:practice_app/services/dictionary/dictionary_manager.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.singleton<_i4.Authentication>(_i4.Authentication());
    gh.singleton<_i5.DialogManager>(_i5.DialogManager());
    gh.singleton<_i6.DictionaryManager>(_i6.DictionaryManager());
    return this;
  }
}
