import 'dart:convert';
import 'dart:math';

import 'package:fipola_app/model/CartModel.dart';
import 'package:fipola_app/screens/Checkout.dart';
import 'package:fipola_app/screens/OrderSuccessful.dart';
import 'package:fipola_app/utils/AppUrl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String xx_id = "";
Future<List<CartModel>> fetchPhotos(http.Client client) async {
  final response = await client
      .post('https://shopninja.in/nonveg/api2/public/index.php/getcart', body: {
    "customer_id": "" + xx_id,
  });

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<CartModel> parsePhotos(String responseBody) {
  final parsed1 = jsonDecode(responseBody);
  final parsed = parsed1["msg"].cast<Map<String, dynamic>>();

  return parsed.map<CartModel>((json) => CartModel.fromJSON(json)).toList();
}

toastMessage(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}

class Cart extends StatefulWidget {
  @override
  Carts createState() => Carts();
}

randn() {
  var rng = new Random();
  return "Order_" + rng.nextInt(9999999).toString();
}

String pricez(List<CartModel> args) {
  var sum = 0;
  args.forEach((element) {
    sum = sum + int.parse(element.product_sale_price);
  });

  return sum.toString();
}

String cartids(List<CartModel> args) {
  var sum = "";
  args.forEach((element) {
    //create_order(element.cart_id, element.title, element.name, element.quantity);
    sum = sum + "," + element.cart_id;
  });

  return sum.toString();
}

class Carts extends State<Cart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      int status = preferences.getInt("status");
      xx_id = preferences.getString("id");
    });
  }

  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CartModel>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            loginToast("No Item in Cart");
            return snapshot.error;
          }

          return snapshot.hasData
              ? CartState(cartList: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _FAQState();
//  }

}

class CartState extends StatelessWidget {
  List<CartModel> cartList;

  CartState({Key key, this.cartList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          //   child:
          //   Container(
          //       child:
          //       Text("ITEMS IN YOUR CART",
          //           textDirection: TextDirection.ltr,
          //           style: TextStyle(
          //               color: Colors.black, fontWeight: FontWeight.bold))),
          // ),
          Flexible(
            child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  final CartModel item = cartList[index];
                  return Dismissible(
                    // Each Dismissible must contain a Key. Keys allow Flutter to
                    // uniquely identify widgets.
                    key: Key(UniqueKey().toString()),
                    // Provide a function that tells the app
                    // what to do after an item has been swiped away.
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        // Center(child: CircularProgressIndicator())
                        showLoaderDialog(context);
                        //alertBox(context, cartList[index].cart_id,cartList);
                        removeFromCart(context, cartList[index].cart_id, cartList);
                       // remove(context, cartList[index].cart_id);
                      } else {
                        // // Then show a snackbar.
                        // Scaffold.of(context)
                        //     .showSnackBar(SnackBar(content: Text(item.name + " added to carts"), duration: Duration(seconds: 1)));
                      }
                      // Remove the item from the data source.

                      cartList.removeAt(index);
                    },
                    // Show a red background as the item is swiped away.
                    background: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Divider(
                            height: 0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Container(
                                  decoration: BoxDecoration(color: Colors.white),
                                  child:Image(
                                    image: NetworkImage(cartList[index].image),
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              title: Text(
                                cartList[index].product_title,
                                style: TextStyle(fontSize: 14),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 1),
                                        child: Text('Price : Rs '+cartList[index].product_sale_price,
                                            style: TextStyle(
                                              color:
                                                  Colors.redAccent,
                                              fontWeight: FontWeight.w700,
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50, bottom: 10),
            child: ButtonTheme(
              buttonColor: Colors.black,
              minWidth: double.infinity,
              height: 40.0,
              child: RaisedButton(
                onPressed: () {
                  showLoaderDialog(context);
                  checkOut(context);
                },
                child: Text(
                  "CHECKOUT",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkOut(BuildContext context) async {
    var xyz = randn();
    final response = await http.post(AppUrl.CREATE_ORDER, body: {
      "customer_id": "" + xx_id,
      "product_id": "" + cartids(cartList),
      "amount": "" + pricez(cartList),
      "order_id": "" + xyz,
    });

    final data = jsonDecode(response.body);
    int value = data['status'];

    if (value == 200) {
      print("Order created");
      toastMessage("Order created");
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return Checkout(pricez(cartList), xyz);
      }));
    } else {
      print("fail");
      toastMessage("Some Error Occurred");
    }
  }

  void alertBox(
      BuildContext context, String cart_id, List<CartModel> CartList) {
    var alertDialog = AlertDialog(
      title: Text(
        'Confirm Remove Item',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: Text(
        'Do you really want to remove it from Cart?',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'No',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(
            'Yes',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            showLoaderDialog(context);
            removeFromCart(context, cart_id, cartList);
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Removing...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void removeFromCart(
      BuildContext context, String cart_id, List<CartModel> cartList) async {
    final response = await http.post(AppUrl.REMOVE_CART, body: {
      "cart": cart_id,
    });

    final data = jsonDecode(response.body);
    int value = data['status'];

    if (value == 200) {
      print("Removed item from cart");
      Navigator.pop(context);

      loginToast("item removed from cart");
    } else {
      print("fail");
      loginToast("Some Error Occurred");
    }
  }

  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}
