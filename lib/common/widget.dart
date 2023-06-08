import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
    this.title, {
    super.key,
    this.onTap,
    this.page,
  }) : assert(onTap != null || page != null, 'onTap 和 page 必须设置一个');

  final String title;
  final Widget? page;

  /// 点击回调
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      onTap: () {
        if (onTap == null) {
          Get.to(page!);
        } else {
          onTap!();
        }
      },
    );
  }
}
