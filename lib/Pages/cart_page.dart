import 'package:flutter/material.dart';

import 'package:restaurant_table_reservation/models/cart.dart';
import 'package:restaurant_table_reservation/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl3.make(),
      ),
      body: Column(children: [
        const CartList().p32().expand(),
        const Divider(),
        const CartTotal(),
      ]),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);
  // final _paymentItems = <PaymentItem>[];

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
              // _paymentItems.add(PaymentItem(
              //     amount: _cart.totalPrice.toString(), label: "emp"));
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
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  AddMutation(_cart.items[index]);
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
