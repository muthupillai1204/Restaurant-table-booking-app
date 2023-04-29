import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserModel {
  String? id;
  final String email;
  final String name;
  final String password;
  final String phoneno;
  final String username;

  UserModel(
      {this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.phoneno,
      required this.username});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
        email: doc['email'],
        name: doc['name'],
        password: doc['password'],
        phoneno: doc['phoneno'],
        id: doc['id'],
        username: doc['username']);
  }

  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phoneno": phoneno,
      "id": id,
      "username": username
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        // id: document.id,

        email: data['email'],
        name: data['name'],
        password: data['password'],
        phoneno: data['phoneno'],
        id: data['id'],
        username: data['username']);
  }
}

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    await _db.collection("users").add(user.toJson());
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
}
