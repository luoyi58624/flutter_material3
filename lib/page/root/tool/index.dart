import 'package:flutter/material.dart';
import 'package:flutter_material3/router/routes.dart';
import 'package:get/get.dart';

class ToolPage extends StatefulWidget {
  const ToolPage({super.key});

  @override
  State<ToolPage> createState() => _ToolPageState();
}

class _ToolPageState extends State<ToolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的工具'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.toolDetail2);
            },
            child: Text('列表-$index'),
          ),
        ),
      ),
    );
  }
}

class ListDetailPage extends StatelessWidget {
  const ListDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('xxx'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('返回列表'),
        ),
      ),
    );
  }
}

class ListDetailPage2 extends StatelessWidget {
  const ListDetailPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('xxx'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('返回列表'),
        ),
      ),
    );
  }
}
