import 'dart:async';

import 'package:fipola_app/screens/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class navheader extends StatefulWidget {
  @override
  _navheaderState createState() => _navheaderState();
}

class _navheaderState extends State<navheader> {
  String _name="";
  String _email = "";
  bool islogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getName().then(updateName);
    getEmail().then(updateEmail);
    getLoginStatus().then(updateLoginStatus);
  }

  Future<String> _getName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String user_name = preferences.getString("name");
    return user_name;
  }

  Future<String> getEmail() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString("email");
    return email;
  }

  Future<bool> getLoginStatus() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool login_status  = preferences.getBool("islogin");
    return login_status;
  }

  Widget setUpNavHeader() {
    if (islogin == true) {
      return new DrawerHeader(
        child: Row(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_pic.png'),
                radius: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(7, 45, 0, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      _name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      _email,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else{
      return new GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
        },
        child: Container(
          margin: EdgeInsets.all(12),
          child: Text(
            "Login",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: setUpNavHeader(),
    );
  }

  void updateName(String name) {
    setState(() {
      this._name = name;
    });
  }

  void updateEmail(String email) {
    setState(() {
      this._email = email;
    });
  }


  void updateLoginStatus(bool login_status) {
    setState(() {
      this.islogin = login_status;
    });
  }
}