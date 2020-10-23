import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class feedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: Text(
              'Excellent job NonVegHouse.com!!.. you have it all anti-biotic free meat, clean and hygienic stores,great customer service..keep up the good work.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0,15, 0, 20),
            child: Text(
              '- Yuvaraj',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
