import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class Alogin extends StatefulWidget {
  const Alogin({Key? key}) : super(key: key);

  @override
  State<Alogin> createState() => _AloginState();
}

class _AloginState extends State<Alogin> {
  //_underscore means making class private
  //in stateless widget we can create one class but incase of statefullwidget there will be 2 class

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  get child => null; //basically we can acess globally
  late int num;
  bool _isVisible = false;
  final TextEditingController adminemail = TextEditingController();
  final TextEditingController adminpassword = TextEditingController();

  void adminloginVerify() async {
    try {
      await FirebaseFirestore.instance
          .collection("admin")
          .doc("adminLogin")
          .snapshots()
          .forEach((element) {
        if (element.data()?['adminEmail'] == adminemail.text &&
            element.data()?['adminPassword'] == adminpassword.text) {
          showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
          Timer(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, MyRoutes.apRoute);
          });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("I think you are not admin...!"),
                );
              });
          Timer(const Duration(seconds: 2), () {
            Navigator.pop(context);
          });
        }
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Error"),
            );
          });
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    //in function functionname start with small letter and second letter of 1 letter will be capital
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60.0,
                ),

                const Text(
                  "Hello Admin",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 104, 104, 104)),
                ),

                const SizedBox(
                  height: 25.0,
                ),

                Image.asset(
                  "assets/images/admin_login.png",
                  fit: BoxFit.cover,
                  height: 300,
                ), //fit means size of image

                const SizedBox(
                  height: 45.0,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  // width: size.width * 0.8,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    //symmetrical means size giving from horizontal and vertical

                    child: Column(
                      children: [
                        TextFormField(
                          controller: adminemail,
                          cursorColor: Colors.blueGrey,
                          //creating password username text form
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 56, 55, 53),
                            ),
                            hintText: "Please Enter Email",
                            labelText: "Email/Username",
                          ), //inside all properties
                          validator: (value) {
                            //validation for username
                            if (value!.isEmpty) {
                              //r means raw string, RegExp means Reject expression, ^=begining, $=ending
                              return "Email should not empty ";
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.+[\w]{2,4})')
                                .hasMatch(value)) {
                              //w means anykind of number or digit or letter
                              return "Please enter valid email!";
                            }

                            return null;
                          },

                          onChanged: (value) {
                            name =
                                value; //if any changes in textfield it will get callback
                            setState(() {
                              //creating method for rebuild(recall the build method) and statechange it only works in statefullwidget not stateless
                            });
                          },
                        ),
                        TextFormField(
                          controller: adminpassword,
                          //adavntage of texform is to create form
                          //creating password username text form
                          obscureText:
                              !_isVisible, //text dikna chaiye yaah nhi dikna chaiye "Bydefault it is false"
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 59, 58, 55),
                            ),
                            hintText: "Please Enter password",
                            labelText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: _isVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ), //inside all properties

                          validator: (value) {
                            //validation for username
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length <= 8) {
                              return "Password should be atleast 8 characters";
                            } else if (value.length >= 15) {
                              return "Password should not be greater than 15 characters";
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(240, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 43, 42, 42),
                            padding: const EdgeInsets.all(15.0),
                            foregroundColor:
                                const Color.fromARGB(255, 127, 247, 58),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(29.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                // Get.to()

                                // FirebaseAuth.instance.signInWithEmailAndPassword(
                                //     email: adminemail.text,
                                //     password: adminpassword.text);

                                debugPrint("validated");
                                adminloginVerify();
                                // debugPrint("Created new Account");
                              } else {
                                debugPrint("Not validate");
                              }
                            });
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 1.0,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
