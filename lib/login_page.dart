import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // child: Center(
      //     child: Text("Login Page",
      //         style: TextStyle(
      //           fontSize: 40,
      //           color: Colors.blue,
      //           fontWeight: FontWeight.bold,
      //         ))),
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png"),
          Text("Login Page",
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 44.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter Username", labelText: "Username"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                ),
                SizedBox(
                  height: 44.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Hello button click here");
                    //Navigator use to navigate the route from code. ...
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: Text("Login"),
                  style: TextButton.styleFrom(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
