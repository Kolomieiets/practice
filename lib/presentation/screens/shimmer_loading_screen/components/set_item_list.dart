import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/services/global/entity/items_for_shimmer_loading.dart';

class SetItemList extends StatelessWidget {
  final int ind;
  final List<LoadingItems> info;
  const SetItemList(this.ind, this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.h5),
        ),
        child: Image.network(
          info[ind].url,
          errorBuilder: (context, error, stackTrace) =>
              Image.asset('assets/images/placeholder.png'),
          loadingBuilder: ((context, child, loadingProgress) {
            return Stack(
              children: [
                child,
                if (loadingProgress != null) const CircularProgressIndicator(),
              ],
            );
          }),
          height: AppSizes.h50,
          width: AppSizes.w50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(info[ind].title),
      subtitle: Text(
        info[ind].description,
        style: TextStyle(fontSize: AppTextStyle.font10),
      ),
    );
  }
}
