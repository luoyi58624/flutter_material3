import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'router/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: Pages.pages,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
