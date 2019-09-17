import 'package:torii_shopping/src/banners/domain/repositories/banner_repository.dart';

import '../banner.dart';

class GetBannersUseCase {
  BannerRepository _bannerRepository;

  GetBannersUseCase(this._bannerRepository);

  Future<Map<String, List<Banner>>> execute(){
    return _bannerRepository.getBanners();
  }
}