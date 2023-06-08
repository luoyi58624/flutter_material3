import 'package:flutter/material.dart';
import 'package:flutter_material3/common/widget.dart';
import 'package:flutter_material3/page/test/webview.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      body: ListView(
        children: [
          ListTileWidget(
            'webview测试',
            page: const WebviewTestPage(),
          ),
          ...Transition.values
              .map(
                (e) => ListTileWidget(
                  'webview测试 - ${e.name}',
                  onTap: () => Get.to(
                    () => const WebviewTestPage(),
                    transition: e,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
