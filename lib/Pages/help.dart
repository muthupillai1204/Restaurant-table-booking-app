import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 176, 79),
        title: const Text("Help"),
        automaticallyImplyLeading: false,
        shadowColor: const Color.fromARGB(255, 224, 22, 164),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: const Icon(Icons.arrow_back_ios),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is splashscreen(intro)",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/1.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "This is Welcome screen if you are new user first do signup then login",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/2.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "This button indicates two option admin and help,If customer face any issues they can check help option   ",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/18.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 1: If you are new user try to register yourself by giving email and passwords",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/3.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 2:- Enter your phone number for authenticate",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/4.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 4:- Here you will receive otp on your mobile number",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/5.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 5:- Setup your profile by adding username and name",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/6.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "This is your Home Screen",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/7.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Here you can see your email on top as well as logout button to logout from your device",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/8.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 6:- Put your items on cart by taping on that icons",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/9.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 7 : Here you can increase and decrease quanitity of items from cart",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/10.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 8 :Choose your date and seats as per given time slots",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/11.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            Image.asset(
              "assets/images/12.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            Image.asset(
              "assets/images/13.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 9 : Here you can do payments by the given modes of payment",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/14.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 10 : If you selected card payment try to enter your card details",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/15.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "Step 11 : final one, Get your bill by generating it ",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/16.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
            const Text(
              "If you choosen cash mode then you get directly bill and generate it",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/17.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color.fromARGB(255, 211, 199, 27),
              thickness: 3,
            ),
          ],
        ),
      ),
    );
  }
}
