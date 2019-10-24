import 'package:toriishopping/src/common/contracts/analytics_service.dart';
import 'package:toriishopping/src/common/presentation/blocs/bloc_base.dart';

class BrowserBloc extends BlocBase{
  static const screen_name = "Browser: ";
  AnalyticsService _analyticsService;

  String _url;

  BrowserBloc(this._analyticsService);

  void init(String url) {
    this._url = url;
    notifyAnalytics();
  }

  @override
  void dispose() {

  }

  void notifyAnalytics() {
    _analyticsService.sendScreenName(screen_name + _url);
  }
}