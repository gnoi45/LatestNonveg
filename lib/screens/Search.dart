import 'package:fipola_app/screens/Shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height/3,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage("assets/product.png"),
                    width: 80,
                    height: 80,
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 10, 0,0),
                    child: Text(
                      'Search products...',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
