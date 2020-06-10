import 'package:flutter/material.dart';
import 'package:quizzmaker/helper/functions.dart';
import 'package:quizzmaker/views/home.dart';
import 'package:quizzmaker/views/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    checkUserLogedInStatus();
    super.initState();
  }

  checkUserLogedInStatus() async {
    await HelperFunctions.getUserLoggedInDetails().then((value) {
      setState(() {
        _isLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizzMakerApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLoggedIn ?? false) ? Home() : SignIn(),
    );
  }
}
