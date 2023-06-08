import 'package:flutter/material.dart';
import 'package:flutter_material3/common/models.dart';

import 'home_page.dart';
import 'component_page.dart';
import 'tool_page.dart';
import 'template_page.dart';
import 'my_page.dart';

const List<NavModel> _navList = <NavModel>[
  NavModel('首 页', Icons.home_outlined, HomePage()),
  NavModel('组 件', Icons.widgets_outlined, ComponentPage()),
  NavModel('工 具', Icons.token_outlined, ToolPage()),
  NavModel('模 板', Icons.phone_android_outlined, TemplatePag()),
  NavModel('我 的', Icons.account_circle_outlined, MyPage()),
];

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: _navList.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (i) {
          setState(() {
            index = i;
          });
        },
        selectedIndex: index,
        destinations: _navList.map((e) {
          return NavigationDestination(
            icon: Icon(e.icon),
            label: e.title,
          );
        }).toList(),
      ),
    );
  }
}
