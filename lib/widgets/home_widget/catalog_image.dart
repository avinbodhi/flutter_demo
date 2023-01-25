import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/themes.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .rounded
        .color(MyTheme.creamColor)
        .make()
        .w40(context)
        .p16();
  }
}
