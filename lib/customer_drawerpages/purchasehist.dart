import 'package:flutter/material.dart';

class Purchasehist extends StatefulWidget {
  const Purchasehist({Key? key}) : super(key: key);

  @override
  State<Purchasehist> createState() => _PurchasehistState();
}

class _PurchasehistState extends State<Purchasehist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchased History"),
      ),
    );
  }
}
