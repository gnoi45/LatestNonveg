import 'package:fipola_app/screens/Pincode.dart';
import 'package:fipola_app/screens/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:fipola_app/screens/LoginPage.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(
        seconds: 3,
    ),()
    {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => Pincode(),
      ),);
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffbd100),
      body: Container(
        child: Center(
          child: Image(
            image: AssetImage('assets/logo.jpeg'),
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
