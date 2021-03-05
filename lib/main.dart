import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:merenderia2/Home/home.dart';
import 'package:merenderia2/Login/google_sign_in.dart';
import 'package:merenderia2/Login/login_provider.dart';
import 'package:merenderia2/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      //che tipo di stream ascoltiamo
      child: MaterialApp(
        title: 'Merenderia',
        theme: ThemeData(

          primarySwatch: Colors.blue,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

