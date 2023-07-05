import 'package:flutter_material3/page/root/index.dart';
import 'package:get/get.dart';

import 'routes.dart';

var routePages = [
  GetPage(
    name: Routes.root,
    page: () => const RootPage(),
    binding: BindingsBuilder(() {
      Get.lazyPut<RootController>(() => RootController());
    }),
  ),
];
