import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_app/config/injection_config.dart';
import 'package:practice_app/presentation/screens/api_requests_screen/api_requests_screen.dart';
import 'package:practice_app/presentation/screens/calculator_screen/calculator_screen.dart';
import 'package:practice_app/presentation/screens/change_info_screen/change_info_screen.dart';
import 'package:practice_app/presentation/screens/chart_screen/chart_screen.dart';
import 'package:practice_app/presentation/screens/device_info_screen/device_info_screen.dart';
import 'package:practice_app/presentation/screens/geolocation_screen/geolocation.dart';
import 'package:practice_app/presentation/screens/home_screen/home_screen.dart';
import 'package:practice_app/presentation/screens/login_screen/auth_screen.dart';
import 'package:practice_app/presentation/screens/login_screen/components/signup_screen.dart';
import 'package:practice_app/presentation/screens/login_screen/forgot_password_screen.dart';
import 'package:practice_app/presentation/screens/monobank_ui/ui_monobank_list_screen.dart';
import 'package:practice_app/presentation/screens/options%20screen/options_screen.dart';
import 'package:practice_app/presentation/screens/sensors_plus_screen/providers_init.dart';
import 'package:practice_app/presentation/screens/shimmer_loading_screen/shimmer_loading_screen.dart';
import 'package:practice_app/presentation/screens/url_launcher_screen/url_launcher_screen.dart';
import 'package:practice_app/presentation/screens/video_screen/video_screen.dart';
import 'package:practice_app/presentation/screens/work_with_images_screen/screens/carousel_screen/carousel_screen.dart';
import 'package:practice_app/presentation/screens/work_with_images_screen/screens/image_picker_screen/image_picker_screen.dart';
import 'package:practice_app/presentation/screens/work_with_images_screen/work_with_images_screen.dart';

part 'auto_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  static AppRouter get instance => getIt<AppRouter>();
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: ForgotPasswordRoute.page, path: ForgotPasswordScreen.routeName),
      AutoRoute(page: AuthRoute.page, path: AuthScreen.routeName, initial: true),
      AutoRoute(page: HomeRoute.page, path: HomeScreen.routeName),
      AutoRoute(page: VideoRoute.page, path: VideoScreen.routeName),
      AutoRoute(page: DeviceInfoRoute.page, path: DeviceInfoScreen.routeName),
      AutoRoute(page: CalculatorRoute.page, path: CalculatorScreen.routeName),
      AutoRoute(page: UrlLauncherRoute.page, path: UrlLauncherScreen.routeName),
      AutoRoute(
          page: WorkWithImagesRoute.page, path: WorkWithImagesScreen.routeName),
      AutoRoute(page: ImagePickerRoute.page, path: ImagePickerScreen.routeName),
      AutoRoute(page: CarouselRoute.page, path: CarouselScreen.routeName),
      AutoRoute(page: ChangeInfoRoute.page, path: ChangeInfoScreen.routeName),
      AutoRoute(
          page: UiMonobankListRoute.page, path: UiMonobankListScreen.routeName),
      AutoRoute(page: ChartRoute.page, path: ChartScreen.routeName),
      AutoRoute(page: ApiRequestsRoute.page, path: ApiRequestsScreen.routeName),
      AutoRoute(page: OptionsRoute.page, path: OptionsScreen.routeName),
      AutoRoute(page: GeolocationRoute.page, path: GeolocationScreen.routeName),
      AutoRoute(
          page: ShimmerLoadingRoute.page, path: ShimmerLoadingScreen.routeName),
      AutoRoute(
          page: ProvidersInitRoute.page, path: ProvidersInitScreen.routeName),
    ];
  }
}
