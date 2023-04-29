// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../utils/routes.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("ALert"),
                content: const Text("Do you want to exit?"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text("No")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        // Navigator.pushReplacementNamed(
                        //     context, MyRoutes.bodyRoute);
                      },
                      child: const Text("Yes"))
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
          body: Container(
              // color: Color.fromARGB(255, 189, 178, 178),
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 28.0,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/welcomepage.png",
                    // fit: BoxFit.cover,
                    height: 250,
                    width: 350,
                  ),
                ),
                const SizedBox(
                  height: 0.01,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/food.png",
                    // fit: BoxFit.cover,
                    height: 300,
                    width: 350,
                  ),
                ),
                const SizedBox(
                  height: 55.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(244, 59),
                    primary: const Color.fromARGB(255, 188, 60, 211),
                    onPrimary: Colors.orange,
                    padding: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.loginRoute);
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(244, 59),
                    primary: const Color.fromARGB(255, 46, 70, 179),
                    padding: const EdgeInsets.all(15.0),
                    onPrimary: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0)),
                  ),

                  // minWidth: 250,
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.signupRoute);
                  },

                  child: const Text(
                    "SIGNUP",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  "Develop by EMP",
                  style: TextStyle(
                      color: Color.fromARGB(255, 109, 108, 108),
                      fontSize: 12.0),
                )
              ],
            ),
          )),
          floatingActionButton: SpeedDial(
            backgroundColor: const Color.fromARGB(255, 87, 85, 85),
            animatedIcon: AnimatedIcons.menu_close,

            // icon: Icons.question_mark,

            children: [
              SpeedDialChild(
                backgroundColor: Colors.greenAccent,
                child: const Icon(Icons.admin_panel_settings),
                label: "Admin",
                onTap: () => Navigator.pushNamed(context, MyRoutes.aLogin),
              ),
              SpeedDialChild(
                backgroundColor: Colors.redAccent,
                child: const Icon(Icons.help),
                label: "Help",
                onTap: () => Navigator.pushNamed(context, MyRoutes.help),
              ),
            ],
          )
          // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

          ),
    );
  }
}
