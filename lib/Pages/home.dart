// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_table_reservation/models/user_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:restaurant_table_reservation/utils/routes.dart';
import '../models/catalog.dart';
import '../widgets/home_widgets/catalog.header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'my_drawer_header.dart';

UserModel? userModel;
// late String myEmail;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    // (VxState.store as MyStore).items = CatalogModel.items;
    setState(() {});
  }

  var currentPage = DrawerSections.home;
  Future getCurrentUserDataFunction() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUserDataFunction();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Home",
            // style: TextStyle(color: Colors.black),
          ),
          shadowColor: const Color.fromARGB(255, 33, 54, 243),
        ),
        backgroundColor: const Color(0xfff5f5f5),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: Vx.indigo500,
          child: const Icon(CupertinoIcons.cart, color: Colors.white),
        ),
        body: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromRGBO(146, 175, 247, 1),
          child: SingleChildScrollView(
              child:
                  Column(children: [const MyHeaderDrawer(), myDrawerList()])),
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        menuItem(1, "Home", Icons.home,
            currentPage == DrawerSections.home ? true : false),
        menuItem(2, "Update Profile", Icons.update,
            currentPage == DrawerSections.update_profile ? true : false),
        menuItem(3, "Notifications", Icons.notifications,
            currentPage == DrawerSections.notifications ? true : false),
        menuItem(4, "Seat Availability", Icons.chair,
            currentPage == DrawerSections.seats_availability ? true : false),
        menuItem(5, "Offer/Discounts", Icons.discount,
            currentPage == DrawerSections.offers_or_discount ? true : false),
        menuItem(6, "Purchased History", Icons.history,
            currentPage == DrawerSections.purchased_history ? true : false),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            FirebaseAuth.instance.signOut().then((value) {
              debugPrint("Logout");

              Navigator.pushReplacementNamed(context, MyRoutes.loginRoute);
            });
          },
          child: const Text(
            "Logout",
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 58, 117, 226),
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        )
      ]),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      // color: const Color.fromRGBO(146, 175, 247, 1),
      color: selected ? Colors.blueGrey : Colors.transparent,
      child: InkWell(
        // focusColor: selected ? Colors.blueGrey : Colors.transparent,
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            } else if (id == 2) {
              currentPage = DrawerSections.update_profile;
              Navigator.pushNamed(context, MyRoutes.updateprofRoute);
            } else if (id == 3) {
              currentPage = DrawerSections.notifications;
              Navigator.pushNamed(context, MyRoutes.notifyRoute);
            } else if (id == 4) {
              currentPage = DrawerSections.seats_availability;
              Navigator.pushNamed(context, MyRoutes.seatavailRoute);
            } else if (id == 5) {
              currentPage = DrawerSections.offers_or_discount;
              Navigator.pushNamed(context, MyRoutes.discRoute);
            } else if (id == 6) {
              currentPage = DrawerSections.purchased_history;
              Navigator.pushNamed(context, MyRoutes.purchasehistdtRoute);
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                size: 25,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

enum DrawerSections {
  home,
  update_profile,
  notifications,
  seats_availability,
  offers_or_discount,
  purchased_history
}
