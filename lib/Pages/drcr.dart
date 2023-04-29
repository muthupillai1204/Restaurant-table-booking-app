// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay/pay.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/cart.dart';
import '../utils/routes.dart';


class DrCr extends StatefulWidget {
  const DrCr({Key? key}) : super(key: key);

  @override
  State<DrCr> createState() => _DrCrState();
}

class _DrCrState extends State<DrCr> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController CardNumController = TextEditingController();
  final currentemail = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 593,
                      width: 311,
                      decoration: BoxDecoration(
                        // color: const Color.fromARGB(255, 215, 176, 216),
                        color: const Color.fromRGBO(204, 167, 139, 1.0),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(243, 150, 79, 1),
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.2,
                              spreadRadius: 2.0)
                        ],
                      ),
                      padding: const EdgeInsets.all(8.0),
                      // color: Colors.grey,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            const Text(
                              "Please enter your card Details :)",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 28),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  readOnly: true,
                                  keyboardType: TextInputType.emailAddress,
                                  initialValue: currentemail!.email!,
                                  decoration: InputDecoration(
                                      // focusColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 233, 165, 87)),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      // hintText: "Please enter Name",
                                      prefixIcon: const Icon(Icons.mail),
                                      iconColor: Colors.orange,
                                      labelText: "Mail",
                                      fillColor: Colors.white,
                                      filled: true),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(16),
                                    CardNumberInputFormatter()
                                  ],
                                  controller: CardNumController,
                                  decoration: InputDecoration(
                                      // focusColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 233, 165, 87)),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: "1234 1234 1234",
                                      suffixIcon: const Icon(Icons.payment),
                                      iconColor: Colors.orange,
                                      labelText: "Card Number",
                                      fillColor: Colors.white,
                                      filled: true),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Card Number cannot be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                )),

                            // color: Colors.grey,
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: TextFormField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(5),
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          CardMonthInputFormatter()
                                        ],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            // focusColor: Colors.white,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 233, 165, 87)),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            hintText: "MM/YY",
                                            suffixIcon:
                                                const Icon(Icons.date_range),
                                            iconColor: Colors.orange,
                                            labelText: "Ex Date",
                                            fillColor: Colors.white,
                                            filled: true),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Date cannot be empty";
                                          } else {
                                            return null;
                                          }
                                        },
                                      )),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.number,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          // focusColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 233, 165, 87)),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          hintText: "***",
                                          suffixIcon: const Icon(Icons.lock),
                                          iconColor: Colors.orange,
                                          labelText: "CVV",
                                          fillColor: Colors.white,
                                          filled: true),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "CVV cannot be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    // focusColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 233, 165, 87)),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: "Please enter Name",
                                    prefixIcon: const Icon(Icons.person),
                                    iconColor: Colors.orange,
                                    labelText: "Full Name",
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Name cannot be empty';
                                    }
                                    if (value.trim().isNumber()) {
                                      return 'Please enter valid name';
                                    }
                                    // Return null if the entered username is valid
                                    return null;
                                  },
                                )),

                            const SizedBox(
                              height: 70,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 59),
                                backgroundColor:
                                    const Color.fromRGBO(232, 122, 42, 1.0),
                                foregroundColor:
                                    const Color.fromARGB(255, 241, 227, 20),
                                padding: const EdgeInsets.all(10.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(29.0)),
                              ),

                              // minWidth: 250,
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    debugPrint("validated");

                                    Navigator.pushNamed(
                                        context, MyRoutes.drcrbill);
                                  } else {
                                    debugPrint("Invalidate");
                                  }
                                });
                              },

                              child: const Text(
                                "SUBMIT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            )));
  }
}

// Align(
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buff = StringBuffer();
    for (var i = 0; i < inputData.length; i++) {
      buff.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buff.write("  "); //it is for double space for writing number
      }
    }
    return TextEditingValue(
        text: buff.toString(),
        selection: TextSelection.collapsed(
          offset: buff.toString().length,
        ));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (var i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final _paymentItems = <PaymentItem>[];

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Total amount",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          VxConsumer(
            builder: ((context, store, status) {
              _paymentItems.add(PaymentItem(
                  amount: _cart.totalPrice.toString(), label: "emp"));
              return "₹${_cart.totalPrice}"
                  .text
                  .bold
                  .xl3
                  .color(const Color.fromARGB(255, 64, 66, 64))
                  .make();
            }),
            mutations: const {RemoveMutation, AddMutation},
            notifications: const {},
          ),
        ],
      ),
    );
  }
}
