// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController _email = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _email.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Password reset link sent! Check your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
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
                      width: 260,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 191, 243),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                              // color: Color.fromARGB(255, 225, 139, 228),
                              color: Color.fromARGB(153, 205, 172, 248),
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.2,
                              spreadRadius: 2.0)
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 118, 69, 202),
                              fontSize: 20,
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
                        color: const Color.fromARGB(255, 215, 176, 216),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(153, 205, 172, 248),
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
                            "  Please Enter your email and we will send you a password reset link :)\n",
                            style: TextStyle(
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextField(
                                controller: _email,
                                decoration: InputDecoration(
                                    // focusColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 181, 63, 218)),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: "Email Id",
                                    fillColor: Colors.white,
                                    filled: true),
                              )),
                          const SizedBox(
                            height: 300,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 59),
                              backgroundColor:
                                  const Color.fromARGB(255, 131, 101, 185),
                              foregroundColor:
                                  const Color.fromARGB(255, 58, 83, 221),
                              padding: const EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(29.0)),
                            ),

                            // minWidth: 250,
                            onPressed: passwordReset,

                            child: const Text(
                              "Reset",
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
