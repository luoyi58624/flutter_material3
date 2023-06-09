import 'package:flutter/material.dart';
import 'package:flutter_material3/common/widget.dart';
import 'package:flutter_material3/page/test/rich_text_editor.dart';
import 'package:flutter_material3/page/test/webview.dart';

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
          ListTileWidget(
            '富文本编辑器测试',
            page: const RichTextEditorPage(),
          ),
        ],
      ),
    );
  }
}
