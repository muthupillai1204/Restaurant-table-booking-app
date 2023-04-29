import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var auth = FirebaseAuth.instance;
  var isLogin = false;
  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    Timer(const Duration(seconds: 3), () {
      isLogin
          ? Navigator.pushReplacementNamed(context, MyRoutes.homeRoute)
          : Navigator.pushReplacementNamed(context, MyRoutes.bodyRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/welcomepage.png",
            // fit: BoxFit.cover,
            height: 250,
            width: 350,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(
          color: Colors.purple,
        )
      ],
    ));
  }
}
