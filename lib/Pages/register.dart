// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../../Pages/otp.dart';
import '../../utils/routes.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  // final bool _isVisible = false;
  final TextEditingController email = TextEditingController();
  // String email = "";
  final TextEditingController password = TextEditingController();
  final TextEditingController cpassword = TextEditingController();
  String errorMessage = "";
  bool _isVisible = false;
  void emailVerify() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      Navigator.pop(context);

      Navigator.push(
          context,
          MaterialPageRoute(
              // settings: RouteSettings(arguments: password),
              builder: (context) =>
                  Otp(email: email.text, password: password.text)));

      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(e.message.toString()),
            );
          });
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 123, 150, 236)),
                ),

                Image.asset(
                  "assets/images/signup.png",
                  fit: BoxFit.cover,
                  height: 300,
                ),
                //fit means size of image

                const SizedBox(
                  height: 20.0,
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
                          controller: email,
                          // initialValue: email,
                          // cursorColor: ,
                          //creating password username text form
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 43, 153, 243),
                            ),
                            hintText: "Please Enter Email id",
                            labelText: "Email",
                          ), //inside all properties
                          validator: (value) {
                            //validation for username
                            if (value!.isEmpty) {
                              //a.aba@aa_a.com
                              return "Email id cannot be empty";
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.+[\w]{2,4})')
                                .hasMatch(value)) {
                              //w means anykind of number or digit or letter
                              return "Please enter valid email!";
                            }

                            return null;
                          },
                        ),
                        TextFormField(
                          controller: password,
                          //adavntage of texform is to create form
                          //creating password username text form
                          // obscureText:
                          //     true, //text dikna chaiye yaah nhi dikna chaiye "Bydefault it is false"
                          obscureText: !_isVisible,
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 43, 153, 243),
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
                              )), //inside all properties

                          validator: (pass) {
                            //validation for username
                            if (pass!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (pass.length <= 8) {
                              return "Password length should be atleast 8";
                            } else if (pass.length >= 15) {
                              return "Password should not be greater than 15 characters";
                            }

                            return null;
                          },
                        ),
                        TextFormField(
                          controller: cpassword,
                          //adavntage of texform is to create form
                          //creating password username text form
                          // obscureText:
                          //     true, //text dikna chaiye yaah nhi dikna chaiye "Bydefault it is false"
                          obscureText: !_isVisible,
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 43, 153, 243),
                              ),
                              hintText: "Please Re-enter password",
                              labelText: "Confirm Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: _isVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              )), //inside all properties

                          validator: (cpass) {
                            //validation for username
                            if (cpass!.isEmpty) {
                              return "Please re-enter your password";
                            } else if (cpass.length < 8) {
                              return "Confirm Password length should be atleast 8";
                            } else if (password.text != cpassword.text) {
                              return "Password do not match";
                            }

                            return null;
                          },
                        ),
                        Center(
                          child: Text(errorMessage),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(244, 59),
                            backgroundColor:
                                const Color.fromARGB(255, 65, 130, 250),
                            padding: const EdgeInsets.all(15.0),
                            foregroundColor:
                                const Color.fromARGB(255, 185, 197, 23),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(29.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                debugPrint("validated ");
                                debugPrint("Created new Account");
                                emailVerify();
                              } else {
                                debugPrint("Not validate");
                              }
                            });
                          },
                          child: const Text(
                            "SIGNUP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const DefaultTextStyle(
                                style:
                                    TextStyle(decoration: TextDecoration.none),
                                child: Text(
                                  "Already have an Account?",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 43, 153, 243),
                                      fontSize: 15),
                                )),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, MyRoutes.loginRoute);
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 13, 146, 255),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
