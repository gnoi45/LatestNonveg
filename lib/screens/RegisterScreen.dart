import 'dart:convert';

import 'package:fipola_app/utils/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'SignIn.dart';
import 'package:http/http.dart' as http;


int _state=0;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {

  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    super.dispose();
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Sign Up",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
  }

  register(String _name,String _email,String _phoneNumber,String _password) async {
    final response = await http
        .post(AppUrl.REGISTER, body: {
      "name": _name,
      "email": _email,
      "mobile":_phoneNumber,
      "password":_password
    });

    final data = jsonDecode(response.body);
    int value = data['status'];

    if (value == 200) {
      _state=0;
      print("Logged IN");
      loginToast("Successfully Registered");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
    } else {
      _state=0;
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
        textColor: Colors.white
    );
  }


  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: InkWell(
                child: Container(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.close),

                  ),

                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child:  Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: defaultFontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                )
            ),
            SizedBox(
              height: 100,
            ),
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
                    Icons.title,
                    color: Color(0xFF666666),
                    size: defaultIconSize,
                  ),
                  fillColor: Color(0xFFF2F3F5),
                  hintStyle: TextStyle(
                      color: Color(0xFF666666),
                      fontFamily: defaultFontFamily,
                      fontSize: defaultFontSize),
                  hintText: "User Name",
                ),
              ),
                  SizedBox(
                    height: 15,
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
                    Icons.email,
                    color: Color(0xFF666666),
                    size: defaultIconSize,
                  ),
                  fillColor: Color(0xFFF2F3F5),
                  hintStyle: TextStyle(
                      color: Color(0xFF666666),
                      fontFamily: defaultFontFamily,
                      fontSize: defaultFontSize),
                  hintText: "Email Id",
                ),
              ),
    SizedBox(
    height: 15,
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
                        Icons.phone,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "Phone Number",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
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
                        Icons.lock,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                      ),
                      hintText: "Password",
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(17.0),
                      onPressed: () {

                        if(myController.text.isEmpty)
                          {
                            loginToast("Please Enter Name");
                            return;
                          }

                        if(myController1.text.isEmpty)
                        {
                          loginToast("Please Enter Email Id");
                          return;
                        }

                        if (!RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(myController1.text)) {
                          loginToast("Please Enter Valid Email Id");
                          return;
                        }

                        if(myController2.text.isEmpty)
                        {
                          loginToast("Please Enter Mobile Number");
                          return;
                        }
                        if(myController2.text.startsWith("0") || myController2.text.startsWith("1") || myController2.text.startsWith("2") || myController2.text.startsWith("3") || myController2.text.startsWith("4") || myController2.text.startsWith("5"))
                        {
                          loginToast("Please Enter valid Mobile Number");
                          return;
                        }
                        if(myController2.text.length != 10)
                        {
                          loginToast("Mobile Number should be 10 digits");
                          return;
                        }

                        if(myController3.text.isEmpty)
                        {
                          loginToast("Please Enter Password");
                          return;
                        }
                        if(myController3.text.length < 7)
                        {
                          loginToast("Password must be atleast 7 characters");
                          return;
                        }

                        setState(() {
                          _state=1;
                        });

                        register(myController.text,myController1.text,myController2.text,myController3.text);
                      },
                      child: setUpButtonChild(),
//                    child: Text(
//                      'Sign In',
//                      style: TextStyle(
//                        color: Colors.white,
//                      ),
//                    ),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blue)),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
    ),
    );
  }
}
