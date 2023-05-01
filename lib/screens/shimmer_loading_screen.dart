import 'package:flutter/material.dart';
import 'package:practice_app/objects/items_for_shimmer_loading.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';
import 'package:skeletons/skeletons.dart';
// import 'package:shimmer/shimmer.dart';

class ShimmerLoadingScreen extends StatefulWidget {
  static const String routeName = '/shimmer';
  const ShimmerLoadingScreen({super.key});

  @override
  State<ShimmerLoadingScreen> createState() => _ShimmerLoadingScreenState();
}

class _ShimmerLoadingScreenState extends State<ShimmerLoadingScreen> {
  List<LoadingItems> _itemList = [
    LoadingItems(
      url: 'https://picsum.photos/seed/picsum/200/300',
      title: 'Static Random Image',
      description:
          'Get the same random image every time based on a seed, by adding /seed/{seed} to the start of the url.',
    ),
    LoadingItems(
      url: 'https://picsum.photos/id/237/200/300',
      title: 'Specific Image',
      description:
          'Get a specific image by adding /id/{image} to the start of the url.',
    ),
    LoadingItems(
      url: 'https://picsum.photos/200/300/?blur',
      title: 'Blur',
      description:
          'Get a blurred image by appending ?blur to the end of the url.',
    ),
    LoadingItems(
      url: 'https://picsum.photos/200/300?grayscale',
      title: 'Grayscale',
      description:
          'Get a grayscale image by appending ?grayscale to the end of the url.',
    ),
  ];

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
    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('Shimmer loading')),
          drawer: const MyDrawer(),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: RefreshIndicator(
              onRefresh: pullRefresh,
              child: ListView.builder(
                  itemCount: _itemList.length,
                  itemBuilder: (context, index) {
                    return _isLoading
                        ? _setSkeleton(index)
                        : _setItemList(index);
                  }),
            ),
          )),
    );
  }

  Future<void> pullRefresh() async {
    _itemList = _itemList.reversed.toList();
    setState(() {});
  }

  Widget _setSkeleton(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Skeleton(
          isLoading: _isLoading,
          skeleton: SkeletonListTile(
            leadingStyle: const SkeletonAvatarStyle(),
            titleStyle: const SkeletonLineStyle(height: 16, width: 100),
            hasSubtitle: true,
            subtitleStyle: SkeletonLineStyle(
                height: 16, width: MediaQuery.of(context).size.width - 100),
          ),
          child: _setItemList(i)),
    );
  }

  Widget _setItemList(int ind) {
    return ListTile(
      leading: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.network(
          _itemList[ind].url,
          errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/placeholder.png'),
          loadingBuilder: ((context, child, loadingProgress) {
            return Stack(
              children: [
                child,
                if (loadingProgress != null) const CircularProgressIndicator(),
              ],
            );
          }),
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(_itemList[ind].title),
      subtitle: Text(
        _itemList[ind].description,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }

}
