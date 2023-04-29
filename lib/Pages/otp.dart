// ignore_for_file: deprecated_member_use, must_call_super

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'otp_verification.dart';
// import 'package:velocity_x/velocity_x.dart';

class Otp extends StatefulWidget {
  // const Otp({Key? key}) : super(key: key);
  final String? email, password;
  const Otp({Key? key, this.email, this.password}) : super(key: key);

  static String verify = "";

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController countrycode = TextEditingController();

  String phone = "";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    countrycode.text = "+91";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 44,
                    ),
                    Container(
                      // color: Colors.yellow,
                      height: 60,
                      width: 145,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(153, 59, 206, 125),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 162, 194, 178),
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.2,
                              spreadRadius: 2.0)
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "OTP",
                          style: TextStyle(
                              color: Color.fromARGB(255, 14, 7, 73),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 593,
                      width: 311,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(237, 231, 231, 0.5),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 96, 187, 143),
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.2,
                              spreadRadius: 2.0)
                        ],
                      ),
                      padding: const EdgeInsets.all(8.0),
                      // color: Colors.grey,
                      child: Column(
                        children: [
                          Text(
                            "      \n"
                            "  We will send you One time Password to your Phone number :)\n",
                            style: TextStyle(
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          Container(
                            // color: Colors.white,
                            height: 50,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.green),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 40,
                                  // height: 30,
                                  child: TextFormField(
                                    controller: countrycode,
                                    // initialValue: "+91",
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                                const Text(
                                  "|",
                                  style: TextStyle(
                                      fontSize: 33, color: Colors.black),
                                ),
                                Expanded(
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      initialValue: phone,
                                      keyboardType: TextInputType.phone,
                                      onChanged: (value) {
                                        phone = value;
                                        _formKey.currentState?.validate();
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phone no",
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter a phone number";
                                        } else if (!RegExp(
                                                r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{2})[-. )]*(\d{2})[-. ]*(\d{3})(?: *x(\d+))?\s*$')
                                            .hasMatch(value)) {
                                          return "Please enter a valid phone number";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 300,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(244, 59),
                              backgroundColor:
                                  const Color.fromARGB(255, 62, 172, 65),
                              foregroundColor:
                                  const Color.fromARGB(255, 185, 197, 23),
                              padding: const EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(29.0)),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  // ignore: unnecessary_string_interpolations
                                  phoneNumber: countrycode.text + phone,
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {},
                                  verificationFailed:
                                      (FirebaseAuthException e) {},
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    Otp.verify = verificationId;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            settings: RouteSettings(
                                              arguments: widget.email,
                                            ),
                                            builder: (context) =>
                                                OtpVerification(
                                                    phone: phone,
                                                    password:
                                                        widget.password)));
                                  },

                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {},
                                );
                              }
                            },
                            child: const Text(
                              "Get Otp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            )));
  }
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
