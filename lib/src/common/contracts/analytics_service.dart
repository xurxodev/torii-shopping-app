import 'package:toriishopping/src/common/contracts/analytics_events.dart';

abstract class AnalyticsService {
  void sendScreenName(String name);
  void sendEvent(AnalyticsEvent event);
}
