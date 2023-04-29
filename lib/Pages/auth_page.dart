import 'package:flutter/material.dart';
import 'package:restaurant_table_reservation/Pages/login.dart';
import 'package:restaurant_table_reservation/Pages/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially,show the login page
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const LoginPage();
    } else {
      return const Signup();
    }
  }
}
