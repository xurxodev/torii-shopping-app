import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toriishopping/src/browser/presentation/blocs/browser_bloc.dart';
import 'package:toriishopping/src/browser/presentation/screens/browser_screen.dart';
import 'package:toriishopping/src/common/di/depdendencies_provider.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';

class NotificationsHandler extends StatefulWidget {
  final Widget child;

  NotificationsHandler({
    Key key,
    @required this.child,
  }): super(key: key);

  @override
  _NotificationsHandlerState createState() => _NotificationsHandlerState();
}

class _NotificationsHandlerState extends State<NotificationsHandler> {
  static const String topic = "generic";
  static const String topicDebug = "genericDebug";

  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        _subscribeToTopic();
      });

      _fcm.requestNotificationPermissions(IosNotificationSettings());
    } else {
      _subscribeToTopic();
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");

      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _navigateToBrowser(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _navigateToBrowser(message);
      },
    );
  }

  void _navigateToBrowser(Map<String, dynamic> message){
    var data = message['data'] ?? message;
    String url = data['url'];

    print("url: $url");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<BrowserBloc>(
          bloc: DependenciesProvider.provideBrowserBloc(),
          child: BrowserScreen(url: url),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    if (iosSubscription != null) iosSubscription.cancel();
    super.dispose();
  }

  _subscribeToTopic() async {
    // Subscribe the user to a topic
    _fcm.subscribeToTopic(topic);

    if (!kReleaseMode) {
      _fcm.subscribeToTopic(topicDebug);
    }
  }
}
