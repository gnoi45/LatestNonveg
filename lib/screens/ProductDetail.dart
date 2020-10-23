import 'dart:convert';

import 'package:fipola_app/model/Product.dart';
import 'package:fipola_app/screens/LoginPage.dart';
import 'package:fipola_app/screens/OrderSuccessful.dart';
import 'package:fipola_app/screens/SignIn.dart';
import 'package:fipola_app/utils/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'Cart.dart';
import 'HomeScreen.dart';

String id="";
class ProductDetail extends StatefulWidget {

  final Product value;

  ProductDetail({Key key, this.value}) : super(key: key);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int count;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 1;
  }

  void increment(){
    setState(() {
      count = count + 1;
    });
  }

  void decrement(){
    if(count == 1){
      setState(() {
        count = 1;
      });
    }
    else{
      setState(() {
        count = count - 1;
      });
    }
  }

  toastMessage(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '${widget.value.title}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(13, 13, 13, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      image: NetworkImage('${widget.value.image}'),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.all(13),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${widget.value.title}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onTap: (){
                                    decrement();
                                  },
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Text(
                                    '$count',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  child: Container(
                                    child: Icon(
                                      Icons.add_circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onTap: (){
                                    increment();
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                                  child: Text(
                                    'Price',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Text(
                                    'Rs ${widget.value.price}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'DESCRIPTION',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                        child: Html(
                          data: widget.value.short_desc,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 22, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.fromLTRB(12, 5, 0, 3),
                                margin: EdgeInsets.fromLTRB(0, 10, 5, 2),
                                child: Text(
                                  'Price',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Rs ${int.parse(widget.value.price) * count}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.fromLTRB(0, 15, 5, 5),
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(50, 5,50, 5),
                              color: Colors.black,
                              child: Text(
                                'Add to Cart ($count)',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: (){
    if (x_id == null || x_id.isEmpty) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
    return new SignIn();
    }));
    } else if (x_id.isNotEmpty) {
      print("added to cart");
      addToCart(widget.value.id);
    }
//                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignIn()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addToCart(String  id) async{
    final response = await http
        .post(AppUrl.ADD_TO_CART, body: {
      "customer_id": ""+x_id,
      "product_id": ""+id,
    });

    final data = jsonDecode(response.body);
    int value = data['status'];

    if (value == 200) {
      print("Item added to cart");
      toastMessage("Item Added to cart");
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return Cart();
      }));
    } else {
      print("fail");
      toastMessage("Some Error Occurred");
    }
  }
}

