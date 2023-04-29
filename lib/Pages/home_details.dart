// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:restaurant_table_reservation/models/catalog.dart';
import 'package:restaurant_table_reservation/widgets/home_widgets/add_to_cart.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xfff5f5f5),
      bottomNavigationBar: Container(
        // color: const Color.white,
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            // Text(
            //   "₹" + catalog.price, //₹
            //   textScaleFactor: 1.7,
            //   style: const TextStyle(
            //     color: Color.fromARGB(255, 18, 76, 124),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 16.0,
            //   ),
            // ),
            "₹${catalog.price}"
                .text
                .color(const Color.fromARGB(255, 104, 38, 18))
                .bold
                .xl4
                .make(),
           
            AddToCart(
              catalog: catalog,
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()), //tag means relation between 2
              child: Image.asset(catalog.image),
            ).h40(context), //height
            Expanded(
                child: VxArc(
              //it will gives u arc
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40.0,
                    ),
                    catalog.name.text.xl4
                        .color(const Color.fromARGB(255, 50, 55, 126))
                        .bold
                        .make(),
                    12.heightBox,
                    catalog.desc.text.italic.xl2
                        .color(const Color.fromARGB(255, 105, 102, 102))
                        .make(),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
