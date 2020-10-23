import 'package:fipola_app/screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NewAccount.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pop(true);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
                    alignment: Alignment.topCenter,
                    child:  Text(
                      'NonVegHouse.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 35,
                          margin: EdgeInsets.fromLTRB(15, 0, 15,0),
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/facebook_logo.png'),
                                width: 60,
                                height: 60,
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                child: Text(
                                  'Login with Facebook',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 35,
                          margin: EdgeInsets.fromLTRB(15, 10, 15,0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/google_logo.png'),
                                width: 60,
                                height: 60,
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                child: Text(
                                  'Login with Google',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            '---------------OR-----------------',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(10,10, 0, 0),
                          child: Text(
                            'Email / Phone Number',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(10,0, 0, 0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Email or phone number',
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
                        Container(
                          margin: EdgeInsets.fromLTRB(30,10, 30, 0),
                          child: RaisedButton(
                            child: Text(
                              'Continue',
                            ),
                            textColor: Colors.black,
                            color: Colors.amber[700],
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                              },
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewAccount())),
                          child: Container(
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.fromLTRB(0,3, 10, 0),
                            child: Text(
                              'Not a Member?',
                              style: TextStyle(
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ),
                      ],
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
}
