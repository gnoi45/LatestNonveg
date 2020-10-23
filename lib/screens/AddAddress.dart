import 'dart:convert';

import 'package:fipola_app/screens/Addresses.dart';
import 'package:fipola_app/screens/Cart.dart';
import 'package:fipola_app/screens/HomeScreen.dart';
import 'package:fipola_app/utils/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AddAddress extends StatefulWidget {

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    myController5.dispose();
    super.dispose();
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
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    return Scaffold(
      appBar:   AppBar(
        // Provide a standard title.
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('Address',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Roboto-Light.ttf')),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  TextField(
                    showCursor: true,
                    controller: myController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.add_location,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "Plot No",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    showCursor: true,
                    controller: myController1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.add_location,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "Street",
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    showCursor: true,
                    controller: myController2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.add_location,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "Area",
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    showCursor: true,
                    controller: myController3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.add_location,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "City",
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    showCursor: true,
                    controller: myController4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.add_location,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "State",
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    showCursor: true,
                    controller: myController5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.add_location,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "PinCode",
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(17.0),
                      onPressed: () {
                        if(myController.text.isEmpty)
                        {
                          loginToast("Please Enter Plot");
                          return;
                        }

                        if(myController1.text.isEmpty)
                        {
                          loginToast("Please Enter Street");
                          return;
                        }

                        if(myController2.text.isEmpty)
                        {
                          loginToast("Please Enter Area");
                          return;
                        }

                        if(myController3.text.isEmpty)
                        {
                          loginToast("Please Enter City");
                          return;
                        }

                        if(myController4.text.isEmpty)
                        {
                          loginToast("Please Enter State");
                          return;
                        }

                        if(myController5.text.isEmpty)
                        {
                          loginToast("Please Enter PinCode");
                          return;
                        }

                        update(myController.text, myController1.text, myController2.text, myController3.text, myController4.text, myController5.text);
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Medium.ttf',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blue)),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void update(String text, String text2, String text3, String text4, String text5, String text6) async{
    final response = await http
        .post(AppUrl.ADD_ADDRESS, body: {
      "cust_id": x_id,
      "plot_no": text,
      "street": text2,
      "area": text3,
      "city": text4,
      "state": text5,
      "pincode": text6,

    });

    final data = jsonDecode(response.body);
    int value = data['status'];

    loginToast("Address Successfully Added");

//    if (value == 200) {
//      print("Successfully Added");
//      loginToast("Address Successfully Added");
//      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addresses()));
//    } else {
//      print("fail");
//      loginToast("Some Error Occurred");
//    }
  }
}
