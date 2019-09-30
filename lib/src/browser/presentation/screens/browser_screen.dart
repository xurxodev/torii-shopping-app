import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatelessWidget {
  final String url;
  WebViewController _webViewController;

  BrowserScreen({Key key, @required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon:
                  Icon(Platform.isAndroid ? Icons.share : CupertinoIcons.share),
              onPressed: () {
                Share.share(url);
              },
            ),
            IconButton(
                icon: Icon(Icons.clear_all),
                onPressed: () {
                  _webViewController.clearCache();
                  CookieManager().clearCookies();
                  _webViewController.loadUrl(url);
                }),
          ],
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
          },
        ));
  }
}
