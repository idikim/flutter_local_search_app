import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  final String link;

  const DetailPage({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    print('link: ${link}');
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialSettings: InAppWebViewSettings(
          mediaPlaybackRequiresUserGesture: true,
          javaScriptEnabled: true,
        ),
        initialUrlRequest: URLRequest(
          url: WebUri(link),
        ),
      ),
    );
  }
}
