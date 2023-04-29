// ignore_for_file: unnecessary_null_comparison, avoid_print
import 'package:flutter/material.dart';
import 'package:restaurant_table_reservation/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'package:fl/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item; //final means no change
  //first item jo class hain jo banayi thi phaile

  const ItemWidget({Key? key, required this.item})
      : assert(
            item != null), //assert is use only for debugging not for production
        super(
            //we put here assert bcoz assert work to check whether the passings are null
            key: key);
  // it come through creating of constructor final fields (which means no change)

  @override
  Widget build(BuildContext context) {
    return Card(
      //item create like border
      child: ListTile(
        //list ke item lagane ke liye ek widget hain(ListStyle)
        onTap: () {
          print(
              "₹{item.name} pressed"); //this is for how many time user tapped on that img etc
        },
        leading: Image.asset(item.image), //in leading we have image
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing:
            // Text(
            //   "₹" + item.price, //₹
            //   textScaleFactor: 1.5,
            //   style: TextStyle(
            //     color: Colors.blue.shade300,
            //     fontWeight: FontWeight.bold,
            //   ),
            // )
            "₹${item.price}".text.bold.xl.make(),
      ),
    );
  }
}
