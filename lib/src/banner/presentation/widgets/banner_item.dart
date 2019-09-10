import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  final String pathImage;

  BannerItem({Key key, @required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container  (
            child: Image.network(
              pathImage,
              fit: BoxFit.cover,
            ),
          ),
        );
  }
}
