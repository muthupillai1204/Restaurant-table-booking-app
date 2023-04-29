import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({Key? key}) : super(key: key);

  @override
  State<CustomerInfo> createState() => CustomerInfoState();
}

class CustomerInfoState extends State<CustomerInfo> {
  final databaseRef = FirebaseDatabase.instance.ref().child(
        "User_Detail",
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Info"),
      ),
      body: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return ListTile(
              title: Text(
                "Name:- " + snapshot.child("name").value.toString(),
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                "id:" +
                    snapshot.child("id").value.toString() +
                    "\n" +
                    "username:- " +
                    snapshot.child("username").value.toString() +
                    "\n" +
                    "email:- " +
                    snapshot.child("email").value.toString() +
                    "\n" +
                    "phone no:- " +
                    snapshot.child("phone no").value.toString(),
                style: const TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                onPressed: () {
                  updateDailog(
                      snapshot.child("username").value.toString(),
                      snapshot.child("name").value.toString(),
                      snapshot.child("email").value.toString(),
                      snapshot.child("phone no").value.toString(),
                      context,
                      snapshot.key);
                },
                icon: const Icon(Icons.edit),
              ),
            );
          }),
    );
  }

  Future<void> updateDailog(String username, String name, String email,
      String phone, BuildContext context, var key) {
    var usernameController = TextEditingController(text: username);
    var nameController = TextEditingController(text: name);
    var emailController = TextEditingController(text: email);
    var phoneController = TextEditingController(text: phone);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Update value"),
            content: Column(children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Username"),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Name"),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Email"),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Phone no"),
              ),
            ]),
            actions: [
              TextButton(
                  onPressed: () {
                    updateData(usernameController.text, nameController.text,
                        emailController.text, phoneController.text, key);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
            ],
          );
        });
  }

  void updateData(
      String username, String name, String email, String phone, var key) {
    Map<String, String> x = {
      'username': username,
      'name': name,
    };
    Map<String, String> y = {'email': email, 'phone no': phone};
    databaseRef.child(key).update(x);
    databaseRef.child(key).update(y);
  }
}
