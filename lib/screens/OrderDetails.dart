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

String xx_id="";
Future<List<CartModel>> fetchPhotos(http.Client client) async {
  final response =
  await client.post(AppUrl.ORDER_DETAILS, body: {
    "cart_ids": ""+xx_id,
  });

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<CartModel> parsePhotos(String responseBody) {
  final parsed1 = jsonDecode(responseBody);
  final parsed=parsed1["msg"].cast<Map<String, dynamic>>();

  return parsed.map<CartModel>((json) => CartModel.fromJSON(json)).toList();
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


class OrderDetails extends StatefulWidget
{

  OrderDetails(String x)
  {
     xx_id=x;
  }

  @override
  OrderDetailsx createState() => OrderDetailsx();
}

randn() {
  var rng = new Random();
  return "Order_"+rng.nextInt(9999999).toString();
}


String pricez(List<CartModel> args)
{

  var sum=0;
  args.forEach((element) {
    sum=sum+int.parse(element.product_sale_price);
  });

  return sum.toString();
}

String cartids(List<CartModel> args)
{

  var sum="";
  args.forEach((element) {
    //create_order(element.cart_id, element.title, element.name, element.quantity);
    sum=sum+","+element.cart_id;
  });

  return sum.toString();
}

class OrderDetailsx extends State<OrderDetails> {

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
            loginToast("No Items Found");
            return snapshot.error;
          }

          return snapshot.hasData
              ? OrderState(cartList: snapshot.data)
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

class OrderState extends StatelessWidget {

  List<CartModel> cartList;

  OrderState({Key key, this.cartList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                itemCount: cartList.length,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
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
                                margin: EdgeInsets.fromLTRB(7, 0, 10, 0),
                                child: Image(
                                  image: NetworkImage(cartList[index].image),
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(2, 0, 10, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        cartList[index].product_title,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
//                                    Container(
//                                      alignment: Alignment.topLeft,
//                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Text(
//                                        'Quantity:' + cartList[index].qty,
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 13,
//                                        ),
//                                        textAlign: TextAlign.left,
//                                      ),
//                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        'Price: Rs ' + cartList[index].product_sale_price,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    // Container(
                                    //   width: double.infinity,
                                    //   margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                    //   child: RaisedButton(
                                    //     padding: EdgeInsets.all(15),
                                    //     child: Text(
                                    //       'Remove Item',
                                    //       style: TextStyle(
                                    //         color: Colors.white,
                                    //       ),
                                    //     ),
                                    //     color: Colors.black,
                                    //     onPressed: (){
                                    //      // alertBox(context);
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
