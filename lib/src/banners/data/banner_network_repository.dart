import 'dart:convert';

import 'package:toriishopping/src/banners/domain/entities/banner.dart';
import 'package:toriishopping/src/banners/domain/entities/banner_group.dart';
import 'package:toriishopping/src/banners/domain/entities/banner_group_type.dart';
import 'package:toriishopping/src/banners/domain/repositories/banner_repository.dart';
import 'package:toriishopping/src/common/data/api_resository.dart';

class BannerNetworkRepository extends ApiRepository
    implements BannerRepository {
  @override
  Future<List<BannerGroup>> getBanners() async {
    return await _fetchBanners();
  }

  Future<List<BannerGroup>> _fetchBanners() async {
    final response = await super.get('/banners');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return _parse(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  List<BannerGroup> _parse(List<dynamic> json) {
    List<BannerGroup> bannerGroups = new List<BannerGroup>();

    json.forEach((groupJson) {
      BannerGroup bannerGroup = _parseBannerGroup(groupJson);
      bannerGroups.add(bannerGroup);
    });

    return bannerGroups;
  }

  BannerGroup _parseBannerGroup(Map<String, dynamic> json) {
    List<Banner> banners = new List<Banner>();

    json['banners'].forEach((bannerJson) {
      Banner banner = _parseBanner(bannerJson);
      banners.add(banner);
    });

    return new BannerGroup(
        json['name'], _parseBannerGroupType(json['type']), banners);
  }

  Banner _parseBanner(Map<String, dynamic> json) {
    return new Banner(json['imageUrl'], json['linkUrl']);
  }

  BannerGroupType _parseBannerGroupType(String type) {
    BannerGroupType bannerGroupType = BannerGroupType.values.firstWhere(
        (e) => e.toString().toLowerCase().contains(type.toLowerCase()));

    return bannerGroupType;
  }
}
