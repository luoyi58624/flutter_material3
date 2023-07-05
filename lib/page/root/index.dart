import 'package:flutter/material.dart';
import 'package:flutter_material3/common/models.dart';
import 'package:get/get.dart';

import 'home/index.dart';
import 'component/index.dart';
import 'tool/index.dart';
import 'template/index.dart';
import 'user/index.dart';

const List<NavModel> _navList = <NavModel>[
  NavModel('首 页', Icons.home_outlined, HomePage()),
  NavModel('组 件', Icons.widgets_outlined, ComponentPage()),
  NavModel('工 具', Icons.token_outlined, ToolPage()),
  NavModel('模 板', Icons.phone_android_outlined, TemplatePag()),
  NavModel('我 的', Icons.account_circle_outlined, MyPage()),
];

// const List<RouteModel> _navList = [
//   RouteModel('首 页', Icons.home_outlined, '/home'),
//   RouteModel('组 件', Icons.widgets_outlined, '/component'),
//   RouteModel('工 具', Icons.token_outlined, '/tool'),
//   RouteModel('模 板', Icons.phone_android_outlined, '/template'),
//   RouteModel('我 的', Icons.account_circle_outlined, '/user'),
// ];

class RootController extends GetxController {
  final tabbarIndex = 0.obs;
}

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('root page build');
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabbarIndex.value,
          children: _navList.map((e) => e.page).toList(),
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          onDestinationSelected: (i) {
            controller.tabbarIndex.value = i;
          },
          selectedIndex: controller.tabbarIndex.value,
          destinations: _navList.map((e) {
            return NavigationDestination(
              icon: Icon(e.icon),
              label: e.title,
            );
          }).toList(),
        ),
      ),
    );
  }
}
