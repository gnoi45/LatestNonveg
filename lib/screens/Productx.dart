import 'dart:convert';

import 'package:fipola_app/model/Product.dart';
import 'package:fipola_app/screens/Products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

import 'ProductDetail.dart';


class Productx extends StatelessWidget {

  final ids=[1,2,3,4,5,6];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Shop',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'CHICKEN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'GOAT',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'FISH',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'EGG',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'COMBO',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'SPICES',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Products("1"),
              Products("6"),
              Products("5"),
              Products("4"),
              Products("3"),
              Products("2"),
            ],
          ),
        ),
      ),
    );
  }

}
