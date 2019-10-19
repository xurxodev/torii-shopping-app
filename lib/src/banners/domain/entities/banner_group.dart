import 'banner_group_type.dart';
import 'banner.dart';

class BannerGroup{
  final String name;
  final BannerGroupType type;
  final List<Banner> banners;

  BannerGroup(this.name, this.type, this.banners);
}
