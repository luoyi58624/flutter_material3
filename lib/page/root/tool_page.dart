import 'package:flutter/material.dart';
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
              Get.to(() => ListDetailPage(title: '列表详情-$index'));
            },
            child: Text('列表-$index'),
          ),
        ),
      ),
    );
  }
}

class ListDetailPage extends StatelessWidget {
  const ListDetailPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
