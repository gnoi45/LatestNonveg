import 'dart:convert';

import 'package:fipola_app/model/OrderModel.dart';
import 'package:fipola_app/screens/Addresses.dart';
import 'package:fipola_app/screens/HomeScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'OrderDetails.dart';

Future<List<OrderModel>> fetchPhotos(http.Client client) async {
  final response =
  await client.post('https://shopninja.in/nonveg/api2/public/index.php/getorder', body: {
    "cust_id": ""+x_id,
  });

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<OrderModel> parsePhotos(String responseBody) {
  final parsed1 = jsonDecode(responseBody);
  final parsed=parsed1["msg"].cast<Map<String, dynamic>>();

  return parsed.map<OrderModel>((json) => OrderModel.fromJSON(json)).toList();
}

class OrderHistory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<OrderModel>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            loginToast("No Order Found");
            return snapshot.error;
          }

          return snapshot.hasData
              ? OrderState(orderList: snapshot.data)
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

loginToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}

class OrderState extends StatelessWidget {
  @override
  List<OrderModel> orderList = List<OrderModel>();

  OrderState({Key key, this.orderList}) : super(key: key);
  void displayDialog(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text(
        'Cancel Order',
        style: TextStyle(
          color:Colors.black,
        ),
      ),
      content: Text(
        'Do you really want to cancel your order?',
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
          onPressed: (){
            print("Cancelled");
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
          onPressed: (){
            Fluttertoast.showToast(
                msg: 'Order cancelled successfully',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white
            );
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Order History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: orderList.length,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.all(10),
            color: Colors.grey[100],
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.fromLTRB(2, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                orderList[index].order_id,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                'Mode:' + orderList[index].mode,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                'Price: Rs ' + orderList[index].price,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                'Created At : ' + orderList[index].created_at,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'View Details',
                          ),
                          onPressed: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                              return new OrderDetails(orderList[index].product_id.substring(1));
                            }));
                          },
                        ),
                        // FlatButton(
                        //   child: Text(
                        //     'Cancel Order',
                        //   ),
                        //   onPressed: (){
                        //     displayDialog(context);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
