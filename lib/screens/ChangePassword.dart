import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePassword extends StatefulWidget {

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  int _state=0;

  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
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


  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Save",
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Change Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    showCursor: true,
//                    controller: myController,
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
                          fontSize: defaultFontSize),
                      hintText: "Current Password",
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
                        Icons.lock,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "New Password",
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
                        Icons.lock,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "Re Enter Password",
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(17.0),
                      onPressed: ()
                      {
                        if(myController.text.isEmpty)
                        {
                          loginToast("Please Enter Old Password");
                          return;
                        }
                        else if(myController1.text.isEmpty)
                        {
                          loginToast("Please Enter New Password");
                          return;
                        }
                        else if(myController2.text.isEmpty)
                        {
                          loginToast("Please Enter Re-Enter Password");
                          return;
                        }
                        setState(() {
                          _state=1;
                        });

//                        Change(myController1.text,myController.text);
                      },
                      child: setUpButtonChild(),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blue)),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
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

void displayDialog(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text(
      'Phone Number',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Container(
      height: 20,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter phone number',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    ),
    actions: <Widget>[
      Container(
        child: RaisedButton(
          color: Colors.black,
          child: Text(
            'GENERATE OTP',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            print("clicked");
          },
        ),
      ),
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
  );
}
