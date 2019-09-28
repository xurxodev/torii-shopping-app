import 'dart:collection';
import 'dart:convert';

import 'package:torii_shopping/src/banners/domain/banner.dart';
import 'package:torii_shopping/src/banners/domain/repositories/banner_repository.dart';
import 'package:torii_shopping/src/common/data/api_resository.dart';

class BannerNetworkRepository extends ApiRepository
    implements BannerRepository {
  @override
  Future<Map<String, List<Banner>>> getBanners() async {
    return await _fetchBanners();
  }

  Future<Map<String, List<Banner>>> _fetchBanners() async {
    final response = await super.get('/banners');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return _parse(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Map<String, List<Banner>> _parse(Map<String, dynamic> json) {
    Map<String, List<Banner>> bannersMap =
        new LinkedHashMap<String, List<Banner>>();

    var services = json['Services'] as List;
    var deals = json['Deals'] as List;
    var products = json['Products'] as List;

    List<Banner> serviceBanners = services.map((i) => _parseBanner(i)).toList();
    List<Banner> dealsBanners = deals.map((i) => _parseBanner(i)).toList();
    List<Banner> productsBanners =
        products.map((i) => _parseBanner(i)).toList();

    bannersMap["Services"] = serviceBanners;
    bannersMap["Deals"] = dealsBanners;
    bannersMap["Products"] = productsBanners;

    return bannersMap;
  }

  Banner _parseBanner(Map<String, dynamic> json) {
    return new Banner(json['imageUrl'], json['linkUrl']);
  }
}
