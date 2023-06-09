import 'package:flutter/material.dart';


class RichTextEditorPage extends StatefulWidget {
  const RichTextEditorPage({Key? key}) : super(key: key);

  @override
  State<RichTextEditorPage> createState() => _RichTextEditorPageState();
}

class _RichTextEditorPageState extends State<RichTextEditorPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('富文本编辑器'),
        ),
        body: Container(),
    );
  }
}
