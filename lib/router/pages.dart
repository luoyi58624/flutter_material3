import 'package:flutter_material3/page/root/index.dart';
import 'package:get/get.dart';

import '../page/root/tool/index.dart';
import 'routes.dart';

abstract class Pages {
  Pages._();

  static List<GetPage> pages = [
    GetPage(
      name: Routes.root,
      page: () => const RootPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RootController>(() => RootController());
      }),
    ),
    GetPage(
      name: Routes.toolDetail,
      page: () => const ListDetailPage(),
    ),
    GetPage(
      name: Routes.toolDetail2,
      page: () => const ListDetailPage2(),
    ),
  ];
}
