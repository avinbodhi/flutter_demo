import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/themes.dart';

class CatalogHeader extends StatelessWidget {
// const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluvish).make(),
        VxTextBuilder("Trending Product's").xl2.make(),
      ],
    );
  }
}
