import 'dart:convert';

import 'package:fipola_app/model/Product.dart';
import 'package:fipola_app/screens/ProductDetail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

class bestsellers extends StatelessWidget {
  final products = ["Chicken Leg", "Chicken Biriyani Cut ", "Chicken Cubes", "Whole Chicken", "Chicken Breasts", "Chicken Curry"];
  final images = ["assets/chicken_leg.png", "assets/chicken_biriyani.png","assets/chicken_cube.png" ,"assets/whole_chicken.jpg", "assets/chicken_breast.png", "assets/chicken_curry.png"];
  final prices = ["170", "115", "150", "200", "150", "110"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: [
          Container(
            color: Colors.grey[300],
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Text(
                'Best Sellers of the Month',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Container(
            height: 300,
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      width: 220,
                      height: 100,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Card(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: Image(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  products[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Rs " + prices[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}