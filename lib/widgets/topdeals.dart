import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class topdeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0,0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Spicy Chicken Lollipop',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: 175,
                  child: Text(
                    'These Chicken Lollipops are prepared from frenched chicken wingle...',
                    textAlign: TextAlign.left,
                  ),

                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                    child: Text(
                      'SHOP NOW',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.amber,
                    onPressed: () => print("Clicked"),
                  ),
                ),
              ],
            ),
            Wrap(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(0), bottomLeft: Radius.circular(100), bottomRight: Radius.circular(0)),
                    child: Image(
                      image: AssetImage('assets/lollipop.jpg'),
                      width: 215,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
