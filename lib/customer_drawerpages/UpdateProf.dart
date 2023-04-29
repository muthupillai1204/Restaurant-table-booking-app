// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';

// import '../utils/routes.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController uname = TextEditingController();

  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffCB9999),
          title: const Text("Edit Profile"),
          automaticallyImplyLeading: false,
          shadowColor: const Color.fromARGB(255, 197, 189, 195),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigator.pop(context, MyRoutes.otpVerificationRoute);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
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
                                // initialValue: widget.email,

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
                                keyboardType: TextInputType.number,
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
                              const SizedBox(
                                height: 50.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Cancel",
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 233, 94, 147),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0, vertical: 20.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(29.0)),
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, MyRoutes.homeRoute);
                                    },
                                    child: const Text(
                                      "Update",
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffCB9999),
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
        ));
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
