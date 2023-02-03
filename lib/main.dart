import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'utils/routes.dart';
import 'utils/themes.dart';

void main() {
  runApp(MyApp());
}

//create stateless widget
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bringVegitables(bag1: false);
    return MaterialApp(
        //home: HomePage(),
        themeMode: ThemeMode.light,
        theme: MyTheme.darkTheme(context),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: MyRoutes.homeRoute,
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => HomePage(),
          MyRoutes.cartRoute: (context) => CartPage(),
        });
  }

  Type get newMethod => MyTheme;

  bringVegitables({required bool bag1, int rupees = 100}) {
    stdout.writeln("this is log");
  }
}
