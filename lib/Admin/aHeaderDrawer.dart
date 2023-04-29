// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AHeaderDrawer extends StatefulWidget {
  const AHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<AHeaderDrawer> createState() => _AHeaderDrawerState();
}

class _AHeaderDrawerState extends State<AHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 77, 202, 202),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 70,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                "assets/images/adddp.jpg",
              ))),
        ),
        const Text(
          "ADMIN",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
