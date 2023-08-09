import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/resources/item_list_for_skeleton.dart';
import 'package:practice_app/presentation/screens/shimmer_loading_screen/components/set_item_list.dart';
import 'package:practice_app/presentation/screens/shimmer_loading_screen/components/set_skeleton.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class ShimmerLoadingScreen extends StatefulWidget {
  static const String routeName = '/shimmer';
  const ShimmerLoadingScreen({super.key});

  @override
  State<ShimmerLoadingScreen> createState() => _ShimmerLoadingScreenState();
}

class _ShimmerLoadingScreenState extends State<ShimmerLoadingScreen>
    with ItemList {
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      _isLoading = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        title: Text(
          DictionaryManager.instance.dictionaryShimmerLoadingScreen.title,
        ),
      ),
      drawer: MyDrawer(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: RefreshIndicator(
          onRefresh: pullRefresh,
          child: ListView.builder(
              itemCount: info.length,
              itemBuilder: (context, index) {
                return _isLoading
                    ? SetSkeleton(index, _isLoading, info)
                    : SetItemList(index, info);
              }),
        ),
      ),
    );
  }
}
