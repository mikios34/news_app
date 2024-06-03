import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatefulWidget {
  final String articleUrl;
  const ArticleDetailPage({required this.articleUrl, super.key});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.articleUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
