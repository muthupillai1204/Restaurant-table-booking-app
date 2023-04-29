// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // children: const [Drawer(child: MyDrawer())],
      children: [
        "FoodBook App"
            .text
            .xl5
            .bold
            .color(const Color.fromARGB(255, 50, 55, 126))
            .make(),
        "Trending dishes".text.xl2.make(),
      ],
    );
  }
}
