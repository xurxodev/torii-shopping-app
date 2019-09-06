import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/torii_colors.dart';
import 'package:torii_shopping/src/common/widgets/torii_card_image.dart';
import 'package:torii_shopping/src/common/widgets/torii_sliver_app_bar.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToriiColors.transparent,
      body: CustomScrollView(
        slivers: <Widget>[
          ToriiSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                  title: Text("Servicios",
                      style: Theme.of(context).textTheme.subtitle)),
              ToriiCardImage(
                pathImage:
                    "https://images-eu.ssl-images-amazon.com/images/G/30/Primevideo/Associates/AssocAds_AVD-5164-International-Spain_250x250.jpg",
              ),
              ListTile(
                  title: Text("Ofertas",
                      style: Theme.of(context).textTheme.subtitle)),
              ToriiCardImage(
                pathImage:
                    "https://ae01.alicdn.com/kf/H7866dd7e4b9f477eb27a1f2948c202dbw.png",
              ),
              ListTile(
                  title: Text("Ofertas",
                      style: Theme.of(context).textTheme.subtitle)),
              ToriiCardImage(
                pathImage:
                    "https://images-eu.ssl-images-amazon.com//images/G/30/digital/music/2019/Associates/020819/ES_020819_EU_MC_Associates_02_300x250._CB454202434_.png",
              ),
              ListTile(
                  title: Text("Ofertas",
                      style: Theme.of(context).textTheme.subtitle)),
              ToriiCardImage(
                pathImage:
                    "https://ae01.alicdn.com/kf/H655dde5f67c54346bffda41357ae23d7F.png",
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
