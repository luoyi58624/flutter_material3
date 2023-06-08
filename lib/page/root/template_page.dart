import 'package:flutter/material.dart';

class TemplatePag extends StatefulWidget {
  const TemplatePag({super.key});

  @override
  State<TemplatePag> createState() => _TemplatePagState();
}

class _TemplatePagState extends State<TemplatePag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的模板'),
      ),
      body: Container(),
    );
  }
}
