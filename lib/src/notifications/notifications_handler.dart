import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toriishopping/src/browser/presentation/screens/browser_screen.dart';

class NotificationsHandler extends StatefulWidget {
  final Widget child;

  NotificationsHandler({
    Key key,
    @required this.child,
  }) : super(key: key);

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
        var notification = _mapMessageToNotification(message);

        print("onMessage: $message");
        final snackBar = SnackBar(
          backgroundColor: Colors.blue,
          duration: Duration(milliseconds: 10000),
          content: Container(
            height: 60.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(notification.title),
                Text(notification.body,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          action: SnackBarAction(
            textColor: Colors.white,
            label: 'ver',
            onPressed: () {
              _navigateToBrowser(notification.url);
            },
          ),
        );


        Scaffold.of(context).showSnackBar(snackBar);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        var notification = _mapMessageToNotification(message);
        _navigateToBrowser(notification.url);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        var notification = _mapMessageToNotification(message);
        _navigateToBrowser(notification.url);
      },
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

  void _navigateToBrowser(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BrowserScreen.createWidget(url)
      ),
    );
  }

  _subscribeToTopic() async {
    // Subscribe the user to a topic
    _fcm.subscribeToTopic(topic);

    if (!kReleaseMode) {
      _fcm.subscribeToTopic(topicDebug);
    }
  }

  Notification _mapMessageToNotification(Map<String, dynamic> message) {
    bool isNotNullOrEmpty(Object o) => (o != null && "" != o);

    String title = "";
    String body = "";
    String url = "";

    if (Platform.isIOS) {
      if (isNotNullOrEmpty(message["aps"]) &&
          isNotNullOrEmpty(message["aps"]["alert"]) &&
          isNotNullOrEmpty(message["aps"]["alert"]["title"])) {
        title = message["aps"]["alert"]["title"];
      }

      if (isNotNullOrEmpty(message["aps"]) &&
          isNotNullOrEmpty(message["aps"]["alert"]) &&
          isNotNullOrEmpty(message["aps"]["alert"]["body"])) {
        body = message["aps"]["alert"]["body"];
      }

      if (isNotNullOrEmpty(message["url"])) {
        url = message["url"];
      }
    } else {
      if (isNotNullOrEmpty(message["notification"]) &&
          isNotNullOrEmpty(message["notification"]["title"])) {
        title = message["notification"]["title"];
      }

      if (isNotNullOrEmpty(message["notification"]) &&
          isNotNullOrEmpty(message["notification"]["body"])) {
        body = message["notification"]["body"];
      }

      if (isNotNullOrEmpty(message["data"]) &&
          isNotNullOrEmpty(message["data"]["url"])) {
        url = message["data"]["url"];
      }
    }

    return Notification(title: title, body: body, url: url);
  }
}

class Notification {
  String title;
  String body;
  String url;

  Notification({this.title, this.body, this.url});
}
