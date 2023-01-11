import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'widgets/drawer.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final viewFlag = false;
  final String name = "Codepur";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData();
  }

  loadJsonData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    print(productData);
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != '' && CatalogModel.items.isNotEmpty)
            ? viewFlag == true
                ? ListView.builder(
                    itemCount: CatalogModel.items.length,
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        item: CatalogModel.items[index],
                      );
                    },
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 16), //item to display in row
                    itemBuilder: (context, index) {
                      final item = CatalogModel.items[index];

                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                          child: Image.network(item.image),
                          header: Container(
                            child: Text(item.name),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.deepPurple),
                          ),
                          footer: Container(
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.lightBlue),
                          ),
                        ),
                      );
                    },
                    itemCount: CatalogModel.items.length,
                  )
            : Center(
                child: const CircularProgressIndicator(
                color: Colors.red,
              )),
      ),
      drawer: MyDrawer(),
    );
  }
}
