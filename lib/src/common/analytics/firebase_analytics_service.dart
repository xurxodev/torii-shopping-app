import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:toriishopping/src/common/contracts/analytics_events.dart';
import 'package:toriishopping/src/common/contracts/analytics_service.dart';

class FirebaseAnalyticsService extends AnalyticsService {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  void sendScreenName(String name) {
    analytics.setCurrentScreen(screenName: name);
  }

  @override
  void sendEvent(AnalyticsEvent event) {
    analytics.logEvent(name: event.name, parameters: event.params);
  }
}
