import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:restaurant_table_reservation/utils/routes.dart';
import '../../Pages/otp.dart';
import 'add_profile.dart';

class OtpVerification extends StatefulWidget {
  final String? phone, password;
  const OtpVerification({Key? key, this.password, this.phone})
      : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 12, 184, 18)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = "";
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, MyRoutes.otpRoute);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 44,
            ),
            Center(
              child: Container(
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
                        offset: Offset(6.0, 6.0),
                        blurRadius: 10.2,
                        spreadRadius: 2.0)
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Verification",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 7, 73),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
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
                            "  Please enter the otp which is sent to your phone number \n" +
                        widget.phone.toString(),
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onChanged: (value) {
                      code = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a otp code";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(244, 59),
                        backgroundColor: const Color.fromARGB(255, 62, 172, 65),
                        foregroundColor:
                            const Color.fromARGB(255, 185, 197, 23),
                        padding: const EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29.0)),
                      ),
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: Otp.verify, smsCode: code);

                          // Sign the user in (or link) with the credential
                          await auth.signInWithCredential(credential);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                          Timer(const Duration(seconds: 2), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    settings:
                                        RouteSettings(arguments: widget.phone),
                                    builder: (context) => AddProfile(
                                        email: email,
                                        password: widget.password)));
                          });
                        } catch (e) {
                          // print("Wrong Otp");
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text(
                                      "Code maybe invalid or incomplete...!"),
                                );
                              });
                          debugPrint(e.toString());
                        }
                      },
                      child: const Text(
                        "Verify & Proceed",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.otpRoute);
                          },
                          child: const Text(
                            "Edit phone number ?",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
