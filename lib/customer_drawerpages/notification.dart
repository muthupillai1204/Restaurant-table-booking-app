import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  // const Notify({Key? key, required String notification}) : super(key: key);
  final String? notification;
  const Notify({Key? key, this.notification}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
