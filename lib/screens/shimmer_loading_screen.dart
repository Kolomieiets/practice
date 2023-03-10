import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/objects/items_for_shimmer_loading.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingScreen extends StatefulWidget {
  static const String routeName = '/shimmer';
  const ShimmerLoadingScreen({super.key});

  @override
  State<ShimmerLoadingScreen> createState() => _ShimmerLoadingScreenState();
}

class _ShimmerLoadingScreenState extends State<ShimmerLoadingScreen> {
  final List<LoadingItems> _itemList = [
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
            child: ListView.builder(
                itemCount: _itemList.length,
                itemBuilder: (context, index) {
                  return _isLoading ? _setShimmer() : _setItemList(index);
                  // return
                  // _isLoading ?
                  // _setSkeleton(index);
                  //  : _setItemList(index);
                }),
          )),
    );
  }

  // Widget _setSkeleton(int i) {
  //   return Skeleton(
  //       isLoading: _isLoading,
  //       skeleton: SkeletonListTile(
  //         leadingStyle: const SkeletonAvatarStyle(
  //           shape: BoxShape.circle,
  //         ),
  //         titleStyle: const SkeletonLineStyle(height: 16, width: 100),
  //         hasSubtitle: true,
  //         subtitleStyle: SkeletonLineStyle(
  //             height: 16, width: MediaQuery.of(context).size.width - 100),
  //       ),
  //       child: _setItemList(i));
  // }

  Widget _setItemList(int ind) {
    return ListTile(
      leading: DottedBorder(
        dashPattern: const [2, 2],
        padding: const EdgeInsets.all(1),
        borderType: BorderType.RRect,
        radius: const Radius.circular(5),
        color: Colors.black,
        strokeWidth: 1,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.network(
            _itemList[ind].url,
            loadingBuilder: ((context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            }),
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(_itemList[ind].title),
      subtitle: Text(
        _itemList[ind].description,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }

  Widget _setShimmer() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    height: 15,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    height: 15,
                    width: MediaQuery.of(context).size.width - 100,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
