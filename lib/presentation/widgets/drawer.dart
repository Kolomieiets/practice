import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/config/auto_router.dart';
import 'package:practice_app/providers/bloc/user_info_bloc.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';
import 'package:practice_app/services/global/entity/name_data.dart';

class MyDrawer extends StatelessWidget {
  final NameData nameData = NameData();
  final AppRouter _router = AppRouter.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: AppSizes.h110,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.black),
              child: BlocBuilder<UserInfoBloc, UserInfoState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () => AppRouter.instance.replace(
                      ChangeInfoRoute(),
                    ),
                    child: Row(
                      children: [
                        state.path.isEmpty
                            ? CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: AppSizes.h50,
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                  color: Colors.white,
                                  height: AppSizes.h30,
                                  width: AppSizes.h30,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                height: AppSizes.h50,
                                width: AppSizes.h50,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSizes.h50),
                                ),
                                child: Image.file(
                                  File(state.path),
                                  height: AppSizes.h50,
                                  width: AppSizes.w50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        SizedBox(width: AppSizes.w16),
                        Text(
                          '${state.nameData?.name ?? DictionaryManager.instance.dictionaryChangeInfoScreen.nameField} ${state.nameData?.surname ?? DictionaryManager.instance.dictionaryChangeInfoScreen.surnameField}',
                          style: TextStyle(color: AppTextStyle.colorWhite),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.homeScreen,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.homeScreenSubtitle,
                    routeName: HomeRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.changeUserInfo,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.changeUserInfoSubtitle,
                    routeName: ChangeInfoRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.urlLauncher,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.urlLauncherSubtitle,
                    routeName: UrlLauncherRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.workWithImages,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.workWithImagesSubtitle,
                    routeName: WorkWithImagesRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.geolocation,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.geolocationSubtitle,
                    routeName: GeolocationRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.deviceInfo,
                    subtitle:
                        DictionaryManager.instance.dictionaryDrawer.deviceInfoSubtitle,
                    routeName: DeviceInfoRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.shimmerLoading,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.shimmerLoadingSubtitle,
                    routeName: ShimmerLoadingRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.sensorsPlus,
                    subtitle:
                    DictionaryManager.instance.dictionaryDrawer.sensorsPlusSubtitle,
                    routeName: ProvidersInitRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.monobank,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.monobankSubtitle,
                    routeName: UiMonobankListRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.telegram,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.telegramSubtitle,
                    routeName: OptionsRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.api,
                    subtitle:
                    DictionaryManager.instance.dictionaryDrawer.apiSubtitle,
                    routeName: ApiRequestsRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.calculator,
                    subtitle: '',
                    routeName: CalculatorRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.chart,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.chartSubtitle,
                    routeName: ChartRoute(),
                    ctx: context),
                const Divider(),
                _listItem(
                    title: DictionaryManager.instance.dictionaryDrawer.video,
                    subtitle: DictionaryManager.instance.dictionaryDrawer.videoSubtitle,
                    routeName: VideoRoute(),
                    ctx: context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listItem({
    required String title,
    required String subtitle,
    required PageRouteInfo<dynamic> routeName,
    required BuildContext ctx,
  }) {
    return ListTile(
      onTap: () {
        Scaffold.of(ctx).closeDrawer();
        if (_router.current.name != routeName) {
          AppRouter.instance.replace(routeName);
        }
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
