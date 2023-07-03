import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViews extends StatelessWidget {
  String? url;
  WebViews(this.url);
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
    );
  }
}
