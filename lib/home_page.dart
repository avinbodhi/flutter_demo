import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = 'NoMagic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to first prog days is $days by $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
