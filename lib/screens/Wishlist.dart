import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Wishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'My Wishlist',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Center(
          child: Text(
            "OOPS! It's empty in here.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
