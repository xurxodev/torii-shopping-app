import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/torii_colors.dart';
import 'package:torii_shopping/src/search/widgets/search_item.dart';
import 'package:torii_shopping/src/search/widgets/search_toolbar.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToriiColors.transparent,
      body: Column(
        children: <Widget>[
          SearchToolbar(),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                    title: Text("Servicios",
                        style: Theme.of(context).textTheme.headline)),
                SizedBox(
                  height: 250.0,
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SearchItem(
                        pathImage:
                        "https://images-eu.ssl-images-amazon.com/images/G/30/Primevideo/Associates/AssocAds_AVD-5164-International-Spain_250x250.jpg",
                      ),
                      SearchItem(
                        pathImage:
                        "https://images-eu.ssl-images-amazon.com/images/G/30/kindle/ku/associates/PD2019/XCM_Manual1177852_ES_KU_Ad_250x250_1561470311.png",
                      ),
                      SearchItem(
                        pathImage:
                        "https://images-eu.ssl-images-amazon.com//images/G/30/digital/music/2019/Associates/020819/ES_020819_EU_MC_Associates_02_300x250._CB454202434_.png",
                      ),
                    ],
                  ),
                ),

                ListTile(
                    title: Text("Ofertas",
                        style: Theme.of(context).textTheme.headline)),
                SizedBox(
                  height: 250.0,
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SearchItem(
                        pathImage:
                        "https://ae01.alicdn.com/kf/H5a6ac74b1a044657a606837cb18e157en.png",
                      ),
                      SearchItem(
                        pathImage:
                        "https://ae01.alicdn.com/kf/H7866dd7e4b9f477eb27a1f2948c202dbw.png",
                      ),
                      SearchItem(
                        pathImage:
                        "https://ae01.alicdn.com/kf/H655dde5f67c54346bffda41357ae23d7F.png",
                      ),
                    ],
                  ),
                ),
                ListTile(
                    title: Text("Productos",
                        style: Theme.of(context).textTheme.headline)),
                SizedBox(
                  height: 250.0,
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SearchItem(
                        pathImage:
                        "https://images-eu.ssl-images-amazon.com/images/G/30/associates/maitri/banner/ES_title_count_44K_assoc_300x250.gif",
                      ),
                      SearchItem(
                        pathImage:
                        "https://images-eu.ssl-images-amazon.com/images/G/30/ES-hq/2018/img/Consumer_Electronics/XCM_1103990_Manual_250x250_1103990_es_consumer_electronics_associates_electronic_store_associate_250x250_jpg_Associates_electronic_store.jpg",
                      ),
                      SearchItem(
                        pathImage:
                        "https://images-eu.ssl-images-amazon.com/images/G/30/associates/22151220_ES_Associates_250x250._CB1198675309_.jpg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
