import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Text(
                'Corporate Office',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Text(
                'Nonveg House,',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Text(
                'Station Road Near Durga Mandir,',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Text(
                'SIWAN, BIHAR 841226 India.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Text(
                'Email : support@nonveghouse.com',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Text(
                'Call Us @ ‪9599074024',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Nonveg House
Station Road Near Durga Mandir
SIWAN, BIHAR 841226
India
Phone number: ‪9599074024
 */