import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class footer extends StatelessWidget {

  final features = ["Delivery within 2 hours", "No Preservatives", "Antibiotic Free", "No Chemicals"];
  final images = ["assets/motorcycle.png", "assets/no-drugs.png", "assets/chemical.png", "assets/chemical.png"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          children: List.generate(features.length, (index){
            return Container(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage(images[index]),
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0,10,0, 0),
                    child: Text(
                      features[index],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
