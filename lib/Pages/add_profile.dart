// ignore_for_file: sized_box_for_whitespace, empty_constructor_bodies, must_be_immutable

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_table_reservation/models/user_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/routes.dart';

class AddProfile extends StatefulWidget {
  String? email, password;
  AddProfile({Key? key, this.email, this.password}) : super(key: key);

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController uname = TextEditingController();

  final TextEditingController name = TextEditingController();
  // final TextEditingController password = TextEditingController();

  bool _isVisible = false;
  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }

  late DatabaseReference databaseRef;

  @override
  void initState() {
    super.initState();

    databaseRef = FirebaseDatabase.instance.ref();
  }

  // emailVerify();
  void addprofVerify() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.email.toString(), password: widget.password.toString());

      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Successfully Registered..!"),
            );
          });
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
      });
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
    String phone = ModalRoute.of(context)!.settings.arguments as String;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffCB9999),
            title: const Text("Add Profile"),
            automaticallyImplyLeading: false,
            shadowColor: const Color.fromARGB(255, 197, 189, 195),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 80),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 80.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Color(0xffE5E1E1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 40.0, left: 20.0, right: 20.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                TextFormField(
                                  controller: uname,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: "Username",
                                      prefixIcon: const Icon(Icons.people),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Username cannot be empty';
                                    }
                                    if (value.trim().length < 4) {
                                      return 'Username must be at least 4 characters in length';
                                    }
                                    // Return null if the entered username is valid
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  // initialValue: name,
                                  controller: name,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: "Name",
                                      prefixIcon: const Icon(Icons.person),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Name cannot be empty';
                                    }
                                    if (value.trim().isNumber()) {
                                      return 'Please enter valid name';
                                    }
                                    // Return null if the entered username is valid
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  initialValue: widget.email,
                                  readOnly: true,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: "Email",
                                      prefixIcon: const Icon(Icons.mail),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  readOnly: true,
                                  keyboardType: TextInputType.number,
                                  // controller: phone,
                                  initialValue: phone,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: "Phone no",
                                      prefixIcon: const Icon(Icons.call),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter a phone number";
                                    } else if (!RegExp(
                                            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                        .hasMatch(value)) {
                                      return "Please enter a valid phone number ";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  // controller: password,
                                  readOnly: true,
                                  initialValue: widget.password,
                                  obscureText: !_isVisible,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "Please Enter password",
                                      labelText: "Password",
                                      prefixIcon: const Icon(Icons.lock),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder(),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: _isVisible
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off),
                                      )),
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
                                const SizedBox(
                                  height: 50.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_formKey.currentState!.validate()) {
                                        debugPrint("validated");
                                        debugPrint("Created new Account");

                                        final user = UserModel(
                                            email: widget.email.toString(),
                                            name: name.text,
                                            password:
                                                widget.password.toString(),
                                            phoneno: phone,
                                            username: uname.text);

                                        createUser(user);
                                        insertData(uname.text, name.text,
                                            widget.email.toString(), phone);
                                        addprofVerify();
                                        // storeNewser(user, context);
                                      } else {
                                        debugPrint("Not validate");
                                      }
                                    });
                                  },
                                  child: const Text("Submit"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffCB9999),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0, vertical: 20.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(29.0)),
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/images/adddp.jpg",
                            width: 151,
                            height: 156,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 15.5,
                          child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                color: Color(0xffCB9999),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.add_a_photo_rounded)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void insertData(String uname, String name, String email, String phone) {
    var key = databaseRef.child("Customers").push().key;
    databaseRef.child("User_Detail").child(key!).set({
      'id': key,
      'username': uname,
      'name': name,
      'email': email,
      'phone no': phone
    });
  }

  OutlineInputBorder myInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: Colors.white,
        width: 3,
      ),
    );
  }

  OutlineInputBorder myFocusBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(color: Color(0xffCB9999), width: 3),
    );
  }
}
