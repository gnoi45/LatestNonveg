import 'package:fipola_app/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewAccount extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[700],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    width: 170,
                    height: 170,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Wrap(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
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
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10,0, 0, 0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'First Name',
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10,0, 0, 0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Last Name',
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10,0, 0, 0),
                                  child: Image(
                                    image: AssetImage('assets/email.png'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10,0, 0, 0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10,0, 0, 0),
                                  child: Image(
                                    image: AssetImage('assets/phone.png'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10,0, 0, 0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10,0, 0, 0),
                                  child: Image(
                                    image: AssetImage('assets/password.png'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10,0, 0, 0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText:'Password',
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    obscureText: true,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30,10, 30, 0),
                            child: RaisedButton(
                              child: Text(
                                'Sign Up',
                              ),
                              textColor: Colors.black,
                              color: Colors.amber[700],
                              onPressed: () {  },
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage())),
                            child: Container(
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.fromLTRB(0,3, 10, 0),
                              child: Text(
                                'Already a Member?',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
