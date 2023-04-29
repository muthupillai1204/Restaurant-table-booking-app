import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';
import 'AHeaderDrawer.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  var currentPage = DrawerSections.adminpanel;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Admin Panel",
          ),
          shadowColor: const Color.fromARGB(255, 68, 70, 94),
        ),
        backgroundColor: const Color(0xfff5f5f5),
        body: Container(),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 82, 84, 88),
          child: SingleChildScrollView(
              child: Column(children: [const AHeaderDrawer(), myDrawerList()])),
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      // color: const Color.fromRGBO(84, 128, 242, 1.0),
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        menuItem(1, "Admin Panel", Icons.admin_panel_settings,
            currentPage == DrawerSections.adminpanel ? true : false),
        menuItem(2, "Customer Info", Icons.people,
            currentPage == DrawerSections.customerinfo ? true : false),
        menuItem(3, "Update Tables", Icons.table_restaurant,
            currentPage == DrawerSections.updatetable ? true : false),
        menuItem(4, "Manage Items", Icons.manage_accounts,
            currentPage == DrawerSections.manageitems ? true : false),
        menuItem(5, "Order info", Icons.book_online,
            currentPage == DrawerSections.orderinfo ? true : false),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              debugPrint("Logout");
              Navigator.pushReplacementNamed(context, MyRoutes.aLogin);
            });
          },
          child: const Text(
            "Logout",
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 71, 148, 148),
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
      color: selected ? Colors.blueGrey : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.adminpanel;
            } else if (id == 2) {
              currentPage = DrawerSections.customerinfo;
              Navigator.pushNamed(context, MyRoutes.customerInfoRoute);
            } else if (id == 3) {
              currentPage = DrawerSections.updatetable;
              Navigator.pushNamed(context, MyRoutes.updatetable);
            } else if (id == 4) {
              currentPage = DrawerSections.manageitems;
            } else if (id == 5) {
              currentPage = DrawerSections.orderinfo;
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
  adminpanel,
  customerinfo,
  updatetable,
  manageitems,
  orderinfo
}
