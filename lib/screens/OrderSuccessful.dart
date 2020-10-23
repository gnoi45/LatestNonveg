import 'package:fipola_app/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OrderSuccessful extends StatefulWidget {
  @override
  _OrderSuccessfulState createState() => _OrderSuccessfulState();
}

class _OrderSuccessfulState extends State<OrderSuccessful> {

  final item = ["Chicken Curry Cut - Skin On", "Chicken Boneless - Cube Cut", "Chicken Curry Cut - Skinless", "Country Chicken Curry Cut - With Skin", "Whole Chicken - Skin On", "Chicken Whole Leg - Skinless", "Chicken Breast Boneless - skinless", "Chicken Biriyani Cut - skinless"];
  final images = ["assets/chicken_curry.png", "assets/chicken_cube.png", "assets/chicken_curry_skinless.png", "assets/chicken_curry.png", "assets/whole_chicken.jpg", "assets/chicken_leg.png", "assets/chicken_breast.png", "assets/chicken_biriyani.png"];
  final price = [115, 240, 125, 379, 252, 170, 120, 125];
  final quantity = ["2", "4", "1", "1", "2", "1", "1", "1"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image(
                  image: AssetImage('assets/tick.png'),
                  width: 80,
                  height: 80,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Thank you for Shopping with Us',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'We got your order and happily preparing it.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50, bottom: 10),
                child: ButtonTheme(
                  buttonColor: Theme.of(context).primaryColor,
                  minWidth: double.infinity,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () {
                      //startPayment();
                      //saveorder("1", "3", "", pricex, context);
                      Navigator.of(context)
                          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                        return new HomeScreen();
                      }));



                    },
                    child: Text(
                      "Go to Home",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
