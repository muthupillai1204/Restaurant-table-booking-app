import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import 'package:restaurant_table_reservation/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/cart.dart';

final _paymentItems = <PaymentItem>[];

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Payment",
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
        shadowColor: const Color.fromARGB(255, 6, 122, 84),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context, MyRoutes.dtRoute);
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
        //inserting buttons inside appbar
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("help btn");
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/Payment.png"),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 131, 211, 27),
              thickness: 3,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(3.0),
              width: double.infinity,
              color: const Color.fromARGB(255, 143, 219, 113),
              child: const Center(
                child: Text(
                  "Modes of Payment",
                  style: TextStyle(
                      fontSize: 20, height: 2.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Divider(
              color: Color.fromARGB(255, 131, 211, 27),
              thickness: 3,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.black,
                    minimumSize: const Size(144, 50),
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0)),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, MyRoutes.payRoute);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                    Timer(const Duration(seconds: 2), () {
                      Navigator.pushReplacementNamed(
                          context, MyRoutes.billRoute);
                    });

                    // Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           // settings: RouteSettings(arguments: password),
                    //           builder: (context) => const Bill()));
                  },
                  child: const Text(
                    "CASH",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.black,
                    minimumSize: const Size(144, 50),
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0)),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, MyRoutes.payRoute);

                    showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                    Timer(const Duration(seconds: 3), () {
                      Navigator.pushReplacementNamed(
                          context, MyRoutes.drcrRoute);
                    });
                  },
                  child: const Text(
                    "Debit/Credit card",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 25.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                GooglePayButton(
                  // ignore: deprecated_member_use
                  paymentConfigurationAsset: "gpay.json",
                  paymentItems: _paymentItems,
                  type: GooglePayButtonType.pay,
                  margin: const EdgeInsets.only(top: 15.0),
                  onPaymentResult: onGooglePayResult,

                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
            const CartTotall()
          ],
        ),
      ),
    );
  }

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
  }
}

class CartTotall extends StatelessWidget {
  const CartTotall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(4.0),
            width: double.infinity,
            color: const Color.fromARGB(255, 143, 219, 113),
            child: const Center(
              child: Text(
                "Your Final Payment is 👇",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          VxConsumer(
            builder: ((context, store, status) {
              _paymentItems.add(PaymentItem(
                  amount: _cart.totalPrice.toString(), label: "emp"));
              return " Pay: ₹${_cart.totalPrice}"
                  .text
                  .bold
                  .italic
                  .xl5
                  // .color(Color.fromARGB(255, 68, 224, 89))
                  .color(Colors.green)
                  .make();
            }),
            mutations: const {RemoveMutation, AddMutation},
            notifications: const {},
          ),
          30.widthBox,
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final _paymentItems = <PaymentItem>[];

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: ((context, store, status) {
              _paymentItems.add(PaymentItem(
                  amount: _cart.totalPrice.toString(), label: "emp"));
              return "₹${_cart.totalPrice}".text.xl5.color(Vx.indigo500).make();
            }),
            mutations: const {RemoveMutation, AddMutation},
            notifications: const {},
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, MyRoutes.dtRoute);
                    if (_cart.items.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Please add some items...!"),
                            );
                          });
                    } else {
                      Navigator.pushNamed(context, MyRoutes.dtRoute);
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 50, 55, 126))),
                  child: "Buy".text.white.make())
              .w40(context)
        ],
      ),
    );
  }
}
