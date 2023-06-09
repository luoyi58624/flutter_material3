import 'package:flutter/material.dart';
import 'package:flutter_material3/common/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class WebviewTestPage extends StatefulWidget {
//   const WebviewTestPage({super.key});
//
//   @override
//   State<WebviewTestPage> createState() => _WebviewTestPageState();
// }
//
// class _WebviewTestPageState extends State<WebviewTestPage> {
//   InAppWebViewController? webViewController;
//   final GlobalKey webViewKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 0,
//         backgroundColor: ColorUtil.primaryColor,
//       ),
//       body: WillPopScope(
//         onWillPop: () async {
//           var flag = await webViewController?.canGoBack();
//           if (flag == true) {
//             webViewController?.goBack();
//             return false;
//           } else {
//             return true;
//           }
//         },
//         child: InAppWebView(
//           key: webViewKey,
//           initialUrlRequest:
//               URLRequest(url: Uri.parse("http://115.159.28.38:10081/#/")),
//           onWebViewCreated: (controller) {
//             webViewController = controller;
//           },
//         ),
//       ),
//     );
//   }
// }

class WebviewTestPage extends StatefulWidget {
  const WebviewTestPage({Key? key}) : super(key: key);

  @override
  State<WebviewTestPage> createState() => _WebviewTestPageState();
}

class _WebviewTestPageState extends State<WebviewTestPage> {
  late WebViewController controller;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
    // controller.setNavigationDelegate(
    //   NavigationDelegate(
    //     onPageStarted: (url) {
    //       debugPrint('请求地址：$url');
    //       setState(() {
    //         loading = true;
    //       });
    //     },
    //     onPageFinished: (url) {
    //       setState(() {
    //         loading = false;
    //       });
    //     },
    //     onWebResourceError: (error) {
    //       setState(() {
    //         loading = false;
    //       });
    //     },
    //   ),
    // );
    controller.setBackgroundColor(const Color(0x00000000));
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    // controller.loadRequest(Uri.parse('https://www.bing.com/?mkt=zh-CN'));
    // controller.loadRequest(Uri.parse('https://www.baidu.com/'));
    // controller.loadRequest(Uri.parse('http://192.168.2.195:10002/'));
    controller.loadRequest(Uri.parse('http://115.159.28.38:8082/#/'));
    // controller.loadFlutterAsset('assets/html/index.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: ColorUtil.primaryColor,
      ),
      body: WillPopScope(
        onWillPop: () async {
          var flag = await controller.canGoBack();
          if (flag == true) {
            controller.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: Column(
          children: [
            Expanded(child: WebViewWidget(controller: controller)),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
