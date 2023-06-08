import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_material3/common/utils.dart';

class WebviewTestPage extends StatefulWidget {
  const WebviewTestPage({super.key});

  @override
  State<WebviewTestPage> createState() => _WebviewTestPageState();
}

class _WebviewTestPageState extends State<WebviewTestPage> {
  InAppWebViewController? webViewController;
  final GlobalKey webViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: ColorUtil.primaryColor,
      ),
      body: WillPopScope(
        onWillPop: () async {
          var flag = await webViewController?.canGoBack();
          if (flag == true) {
            webViewController?.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: InAppWebView(
          key: webViewKey,
          initialUrlRequest:
              URLRequest(url: WebUri("http://115.159.28.38:10081/#/")),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
        ),
      ),
    );
  }
}
