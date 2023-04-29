// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_table_reservation/Admin/ad_login.dart';
import 'package:restaurant_table_reservation/Admin/admin_panel.dart';
import 'package:restaurant_table_reservation/Admin/customerinfo.dart';
import 'package:restaurant_table_reservation/Admin/updatetables.dart';
import 'package:restaurant_table_reservation/Pages/add_profile.dart';
import 'package:restaurant_table_reservation/Pages/body.dart';
import 'package:restaurant_table_reservation/Pages/dateandtime.dart';
import 'package:restaurant_table_reservation/Pages/drcr.dart';
import 'package:restaurant_table_reservation/Pages/forgot_pass.dart';
import 'package:restaurant_table_reservation/Pages/help.dart';
import 'package:restaurant_table_reservation/Pages/home.dart';
import 'package:restaurant_table_reservation/Pages/otp.dart';
import 'package:restaurant_table_reservation/Pages/otp_verification.dart';
import 'package:restaurant_table_reservation/Pages/payment.dart';
import 'package:restaurant_table_reservation/Pages/splash.dart';
import 'package:restaurant_table_reservation/core/store.dart';
import 'package:restaurant_table_reservation/customer_drawerpages/UpdateProf.dart';
import 'package:restaurant_table_reservation/customer_drawerpages/discount.dart';
import 'package:restaurant_table_reservation/customer_drawerpages/notify.dart';
import 'package:restaurant_table_reservation/customer_drawerpages/purchasehist.dart';
import 'package:restaurant_table_reservation/customer_drawerpages/seatavail.dart';
import 'package:restaurant_table_reservation/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/Bill.dart';
import 'Pages/cart_page.dart';
import 'Pages/drcrBill.dart';
import 'Pages/login.dart';
import 'Pages/register.dart';

// ignore: prefer_const_constructors
AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', //id
    'Hight Importance Notifications', //title
    // 'This channel is used for important notification,'//description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("A bg message just showed up : ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        // home: Body(),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          MyRoutes.bodyRoute: (context) => const Body(),
          MyRoutes.spalshRoute: (context) => const SplashScreen(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.fPRoute: (context) => const ForgotPass(),
          MyRoutes.signupRoute: (context) => const Signup(),
          MyRoutes.otpRoute: (context) => const Otp(),
          MyRoutes.otpVerificationRoute: (context) => const OtpVerification(),
          MyRoutes.addProfile: (context) => AddProfile(),
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.aLogin: (context) => const Alogin(),
          MyRoutes.apRoute: (context) => const AdminPanel(),
          MyRoutes.cartRoute: (context) => const CartPage(),
          MyRoutes.dtRoute: (context) => const DtSelect(),
          MyRoutes.payRoute: (context) => const Payment(),
          MyRoutes.updateprofRoute: (context) => const EditProfile(),
          MyRoutes.seatavailRoute: (context) => const SeatAvail(),
          MyRoutes.purchasehistdtRoute: (context) => const Purchasehist(),
          MyRoutes.discRoute: (context) => const Discount(),
          MyRoutes.notifyRoute: (context) => const Notifications(),
          MyRoutes.customerInfoRoute: (context) => const CustomerInfo(),
          MyRoutes.drcrRoute: (context) => const DrCr(),
          MyRoutes.billRoute: (context) => const Bill(),
          MyRoutes.drcrbill: (context) => const DrcrBill(),
          MyRoutes.help: (context) => const Help(),
          MyRoutes.updatetable: (context) => const UpdateTables()
        });
  }
}
