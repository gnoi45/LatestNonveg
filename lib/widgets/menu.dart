import 'package:fipola_app/screens/Products.dart';
import 'package:fipola_app/screens/Shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class menu extends StatelessWidget {
  final ids=[1,2,3,4,5,6];
  final products = ["Chicken", "Goat", "Fish", "Egg", "Combo", "Spice"];
  final images = ["assets/chicken.png", "assets/lamb_goat.png", "assets/sea_food.png", "assets/marinades.png", "assets/cold_cuts.png", "assets/ready_to_cook.png"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 265,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        children: List.generate(products.length, (index){
          return FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage(images[index]),
                    width: 50,
                    height: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0,10,0, 0),
                  child: Text(
                    products[index],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Products(ids[index].toString())));
            },
          );
        }),
      ),
    );
  }
}
