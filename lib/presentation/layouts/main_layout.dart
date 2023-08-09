import 'package:flutter/material.dart';
import 'package:practice_app/utils/pop_utils.dart';

class MainLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget child;
  final bool isPop;
  const MainLayout(
      {this.isPop = true, this.appBar, this.drawer, required this.child});

  @override
  Widget build(BuildContext context) {
    return isPop
        ? WillPopScope(
            onWillPop: () {
              return PopUtils.onWillPop(context);
            },
            child: Scaffold(
              appBar: appBar,
              drawer: drawer,
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: child,
              ),
            ),
          )
        : Scaffold(
            appBar: appBar,
            drawer: drawer,
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: child,
            ),
          );
  }
}
