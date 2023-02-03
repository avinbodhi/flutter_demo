import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: "My Cart".text.center.color(MyTheme.darkBluvish).make()),
    );
  }
}
