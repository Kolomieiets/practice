import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_app/config/auto_router.dart';
import 'package:practice_app/resources/style/app_theme.dart';
import 'package:practice_app/services/global/state_manager/bloc/user_info_bloc/user_info_bloc.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoBloc()..add(UserInfoInitEvent()),
      lazy: false,
      child: ScreenUtilInit(
        designSize: const Size(392.7, 825.5),
        builder: (context, child) {
          return MaterialApp.router(
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.1),
                child: child!,
              );
            },
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: AppTheme.primaryBlack),
            routerConfig: AppRouter.instance.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
