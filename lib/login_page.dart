import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'dart:ffi';

// ignore: slash_for_doc_comments
/**
 * *****
 * 1 . Styling used with border and radius 
 * 2. Use of AnimatedContainer 
 * 3. If condition use 
 * 4. Use of Bool datatype with condition 
 * 5. Conditional expression ternary operator 
 * 6. async and await 
 */

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

//_ use to make that instance private

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  String name = "Hey ";
  final _formKey = GlobalKey<FormState>();

  moveToNextHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  validateMe(String name, String value) {
    if (name == "username") {
      if (value.isEmpty) {
        return "username is empty";
      }
    }
  }

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
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              Text("Welcome \$name",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 44.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "username can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password cant be empty";
                        } else if (value.length < 6) {
                          return 'password length should be atleast 6';
                        } else if (value != "test123") {
                          return "Incorrect password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 44.0,
                    ),
                    //container kind of box which has width and height
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () => moveToNextHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: changeButton ? 50 : 150,
                        height: 40,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 10 : 8)),
                      ),
                    ),
                    //if you want to make click justRefector use
                    //inkwell can see the effect

                    //   ElevatedButton(
                    //     onPressed: () {
                    //       print("Hello button click here");
                    //       //Navigator use to navigate the route from code. ...
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     },
                    //     child: Text("Login"),
                    //     style: TextButton.styleFrom(),
                    //   )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
