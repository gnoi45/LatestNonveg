import 'dart:convert';

import 'package:fipola_app/screens/AddAddress.dart';
import 'package:fipola_app/utils/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

import 'Cart.dart';
import 'OrderSuccessful.dart';


String pricex;
String order_idx;
String address="";
int x=0;
class Checkout extends StatefulWidget {
  Checkout(String price,String order_id)
  {
    pricex=price;
    x=int.parse(pricex)*100;
    order_idx=order_id;
  }

  @override
  State<StatefulWidget> createState() {
    return Checkoutu();
  }
}


Future<String> saveorder(String mode,String payment_status,String payment_id,String amount,BuildContext context) async {
  final response = await http.post(
      AppUrl.SAVE_ORDER,
      body: {
        "user_id": "" + xx_id,
        "order_id":""+order_idx,
        "mode":""+mode,
        "payment_status":""+payment_status,
        "payment_id":""+payment_id,
        "amount":""+amount,
      });

  final data = jsonDecode(response.body);
  int value = data['status'];

  if (value == 200) {
    String nameAPI = data['msg'];

    //loginToast(nameAPI);

    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new OrderSuccessful();
    }));
  } else {

    print("fail");
    //loginToast("Some Error Occurred");
  }
}




class Checkoutu extends State<Checkout> {
  Razorpay _razorpay;
  TextEditingController myController;

  @override
  void initState() {
    super.initState();
    getAddress();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  Future<String> getAddress() async {
    final response = await http.post(
        "https://shopninja.in/nonveg/api2/public/index.php/getUserprofile",
        body: {
          "user_id": "" + xx_id,
        });

    final data = jsonDecode(response.body);
    int value = data['status'];

    if (value == 200) {
      String plot = data['msg']['plot_no'];
      String street = data['msg']['street'];
      String area = data['msg']['area'];
      String city = data['msg']['city'];
      String state = data['msg']['state'];
      String pincode = data['msg']['pincode'];

      if(plot==null)
      {
        setState(() {
          myController = TextEditingController(text: "Not Found");
        });

      }
      else {
        address =
            plot + " ," + street + " ," + area + " ," + city + " ," + state +
                " ," + pincode;

        setState(() {
          myController = TextEditingController(text: address);
        });
      }


    } else {

      print("fail");
      //loginToast("Some Error Occurred");
    }
  }


  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom :30.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text("TOTAL Cost", style: TextStyle(fontSize: 16, color: Colors.grey),)
                            ),
                            Text("Rs "+pricex,  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Text(
                'Address',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 10, 0),
              child: Text(
                ''+myController.text,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAddress()),
                )
              },
              child:Container(
                margin: EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: Text(
                  'Update Address',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
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
                    if(myController.text.contains("Not Found"))
                    {
                      Navigator.of(context)
                          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                        return new AddAddress();
                      }));
                    }
                    else
                    startPayment();


                  },
                  child: Text(
                    "Pay Online",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 10),
              child: ButtonTheme(
                buttonColor: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                height: 40.0,
                child: RaisedButton(
                  onPressed: () {
                    if(myController.text.contains("Not Found"))
                    {
                      Navigator.of(context)
                          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                        return new AddAddress();
                      }));
                    }
                    else
                    saveorder("1", "", "", pricex, context);

                  },
                  child: Text(
                    "Cash On Delivery",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  startPayment() async {
    var options = {
      'key': 'rzp_live_Gr62yIQq7GZDTL',
      'amount': ""+x.toString(),
      'name': 'Shaiq',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {

    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);
    saveorder("2", "1", ""+response.paymentId, pricex, context);

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
    //     timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }
}