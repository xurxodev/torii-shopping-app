import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatelessWidget {
  final String url;

  BrowserScreen({Key key, @required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
          icon: Icon(Platform.isAndroid?Icons.share:CupertinoIcons.share),
          onPressed: () {
            Share.share(url);
          },
        )
      ],),
      body: WebView(
        initialUrl: url ,
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
