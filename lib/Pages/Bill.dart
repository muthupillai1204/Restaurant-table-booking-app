// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/cart.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  final currentemail = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            height: 593,
            width: 311,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 167, 165, 167),
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(153, 47, 46, 48),
                    offset: Offset(5.0, 5.0),
                    blurRadius: 10.2,
                    spreadRadius: 2.0)
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            // color: Colors.grey,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/welcomepage.png",
                    // fit: BoxFit.cover,
                    height: 150,
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 0.01,
                ),
                const Text(
                  "Chembur\n" "Mumbai-400089",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 0.01,
                ),
                const Text(
                  "**************************************",
                  style: TextStyle(fontSize: 15),
                ),
                const CartList().expand(),
                const Text(
                    "----------------------------------------------------------------"),
                CartTotal(),
                const SizedBox(
                  height: 1.0,
                ),
                const Text(
                    "----------------------------------------------------------------"),
                Text(
                  "Customer Email :- " + currentemail!.email!,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Payment method: Cash ",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Seat no:- 7a, 7b ",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("<<<<<CUSTOMERS COPY>>>>>>>")
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // const CartList(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(220, 59),
              backgroundColor: const Color.fromARGB(255, 21, 136, 102),
              foregroundColor: const Color.fromARGB(255, 64, 231, 42),
              padding: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29.0)),
            ),

            // minWidth: 250,
            onPressed: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text("Successfully booked...!"),
                      );
                    });
              });
            },

            child: const Text(
              "Generate bill",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ]),
      ),
    ));
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final _paymentItems = <PaymentItem>[];

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Total amount",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          VxConsumer(
            builder: ((context, store, status) {
              _paymentItems.add(PaymentItem(
                  amount: _cart.totalPrice.toString(), label: "emp"));
              return "₹${_cart.totalPrice}"
                  .text
                  .bold
                  .xl3
                  .color(const Color.fromARGB(255, 64, 66, 64))
                  .make();
            }),
            mutations: const {RemoveMutation, AddMutation},
            notifications: const {},
          ),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing to show".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
