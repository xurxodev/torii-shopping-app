import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:toriishopping/src/browser/presentation/blocs/browser_bloc.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';
import 'package:toriishopping/src/common/presentation/widgets/clear_all_button.dart';
import 'package:toriishopping/src/common/presentation/widgets/share_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class BrowserScreen extends StatelessWidget {
  final String url;
  WebViewController _webViewController;

  BrowserScreen({Key key, @required this.url});

  @override
  Widget build(BuildContext context) {
    BrowserBloc _browserBloc = BlocProvider.of<BrowserBloc>(context);

    _browserBloc.init(url);

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            ShareButton(onPressed: () => Share.share(url)),
            ClearAllButton(onPressed: () {
              if (_webViewController != null){
                _webViewController.clearCache();
                CookieManager().clearCookies();
                _webViewController.loadUrl(url);
              }
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
