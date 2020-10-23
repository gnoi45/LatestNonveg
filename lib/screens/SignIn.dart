import 'dart:convert';

//import 'package:e_relax_hybrid/home/home.dart';
import 'package:fipola_app/screens/HomeScreen.dart';
import 'package:fipola_app/screens/Shop.dart';
import 'package:fipola_app/utils/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import '../AppUrl.dart';
//import '../ForgetPassword.dart';
import 'RegisterScreen.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

int _state=0;
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  login(String _email,String _password) async {
    final response = await http
        .post(AppUrl.LOGIN, body: {
      "username": _email,
      "userpass": _password
    });

    final data = jsonDecode(response.body);
    int value = data['status'];

    if (value == 200) {

      String mobile = data['msg']['mobile'];
      String emailAPI = data['msg']['email'];
      String nameAPI = data['msg']['fullname'];
      String id = data['msg']['id'];
      bool islogin = true;
      setState(() {
        _state=0;
        savePref(mobile, emailAPI, nameAPI, id,value);
      });
      print("Logged IN");
      loginToast("Login Successful");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return HomeScreen();
      }));
    } else {
      setState(() {
        _state=0;
      });
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
  savePref(String mobile, String email, String name, String id,int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("mobile", mobile);
    preferences.setString("email", email);
      preferences.setString("name", name);
      preferences.setString("id", id);
      preferences.setInt("value", value);
//      preferences.setBool("islogin", loginstate);
      preferences.commit();
  }

  final myController = TextEditingController();
  final myController1 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Sign In",
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
//            Flexible(
//              flex: 1,
//              child: InkWell(
//                child: Container(
//                  child: Align(
//                    alignment: Alignment.topRight,
//                    child: Icon(Icons.close),
//                  ),
//                ),
//                onTap: () {
//                  Navigator.pop(context);
//                },
//              ),
//            ),
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 130,
                    alignment: Alignment.center,
                    child: Image.asset("assets/logo.jpeg"),
                  ),
                  SizedBox(
                    height: 15,
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
                        Icons.phone,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "Enter Email Id",
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
                        Icons.lock_outline,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                      ),
                      hintText: "Enter Password",
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 15,
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
                          loginToast("Please Enter email id");
                          return;
                        }
                        if (!RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(myController.text)) {
                          loginToast("Please Enter Valid Email Id");
                          return;
                        }
                        if(myController1.text.isEmpty)
                        {
                          loginToast("Please Enter Password");
                          return;
                        }
                        setState(() {
                          _state=1;
                        });
                        login(myController.text,myController1.text);
//                        Navigator.pop(context);
//                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
//                      child: setUpButtonChild(),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        )
                      },
                      child: Container(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
