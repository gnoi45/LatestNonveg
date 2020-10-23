import 'dart:async';

import 'package:fipola_app/screens/Checkout.dart';
import 'package:fipola_app/widgets/bestsellers.dart';
import 'package:fipola_app/widgets/menu.dart';
import 'package:fipola_app/widgets/navdrawer.dart';
import 'package:fipola_app/widgets/navheader.dart';
import 'package:fipola_app/widgets/topdeals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/feedback.dart';
import '../widgets/footer.dart';
import 'Cart.dart';
import 'Search.dart';
import 'SignIn.dart';


String x_id="";
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  PageController pageController = PageController();
  int pageCount = 4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    Timer.periodic(Duration(seconds: 2), (timer){
      double nextPage = pageController.page+1;
      if(nextPage>=pageCount-1){
        pageController.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.fastLinearToSlowEaseIn);
      }
      else{
        pageController.animateToPage(nextPage.toInt(), duration: Duration(milliseconds: 1000), curve: Curves.fastLinearToSlowEaseIn);
      }
    });

  }



  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      int status = preferences.getInt("status");
      x_id = preferences.getString("id");
    });
  }

  final offersTitles = ["Prawns peeled and deveined - Small", "Chicken curry cut - Skin on", "Asian Chicken Satay", "Madras Pepper Chicken"];
  final offersImages = ["assets/prawns.jpg", "assets/chicken_curry.png", "assets/stay.jpg", "pepper_chicken.jpeg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(
          //     Icons.search,
          //     color: Colors.red,
          //   ),
          //   onPressed: (){
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Search()));
          //   },
          // ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
            onPressed: (){
              if (x_id == null || x_id.isEmpty) {
                Navigator.of(context).push(MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new SignIn();
                    }));
              } else if(x_id.isNotEmpty){
                Navigator.of(context).push(MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new Cart();
                    }));
              }

              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
           // navheader(),
            navdrawer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  LimitedBox(
                    maxHeight: 300,
                    child: PageView(
                      controller: pageController,
                      children: <Widget>[
                        // Container(
                        //   child: Image(
                        //     image: AssetImage(
                        //       'assets/nonban1.jpg',
                        //     ),
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                        Container(
                          child: Image(
                            image: AssetImage(
                              'assets/nonban3.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          child: Image(
                            image: AssetImage(
                              'assets/nonban4.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          child: Image(
                            image: AssetImage(
                              'assets/nonban5.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Container(
                        //   child: Image(
                        //     image: AssetImage(
                        //       'assets/nonban2.png',
                        //     ),
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Wrap(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.black,
                      padding: EdgeInsets.all(7),
                      child: Text(
                        'BROWSE THROUGH OUR RANGE',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              menu(),
              // Container(
              //   color: Colors.grey[300],
              //   padding: EdgeInsets.all(10),
              //   width: MediaQuery.of(context).size.width,
              //   child: Container(
              //     child: Text(
              //       'Top Deal of the Day',
              //       style: TextStyle(
              //         color: Colors.grey[800],
              //         fontSize: 18,
              //         fontWeight: FontWeight.w800,
              //       ),
              //     ),
              //   ),
              // ),
              // topdeals(),
              bestsellers(),
              Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Text(
                    'Testimonial',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              feedback(),

              Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Text(
                    'Footer',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
