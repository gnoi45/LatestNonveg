import 'package:fipola_app/screens/Addresses.dart';
import 'package:fipola_app/screens/ChangePassword.dart';
import 'package:fipola_app/screens/OrderHistory.dart';
import 'package:fipola_app/screens/PersonalDetails.dart';
import 'package:fipola_app/screens/Wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AddAddress.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _name="";
  String _email = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getName().then(updateName);
    getEmail().then(updateEmail);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.amber,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      color: Colors.amber,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              child: Image(
                                image: AssetImage("assets/profile_pic.png"),
                              ),
                              radius: 40,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            alignment: Alignment.center,
                            child: Text(
                              _name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            alignment: Alignment.center,
                            child: Text(
                              _email,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      margin: EdgeInsets.fromLTRB(20, 160, 20, 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderHistory()));
                                    },
                                    child: Container(
                                      margin:EdgeInsets.fromLTRB(0,0,17,0),
                                      child: Icon(
                                        Icons.history,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){

                                    },
                                    child: Container(
                                      margin:EdgeInsets.fromLTRB(15,0,0,0),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderHistory()));
                                    },
                                    child: Container(
                                      child: Text(
                                        'My Orders',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){

                                    },
                                    child: Container(
                                      child: Text(
                                        'Rate Us',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
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
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ListTile(
                        title: Text(
                          'Update Personal Details',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalDetails()));
                        },
                        leading: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ListTile(
                        title: Text(
                          'Change Password',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        leading: Icon(
                          Icons.vpn_key,
                          color: Colors.black,
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePassword()));
                        },
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ListTile(
                        title: Text(
                          'Manage Addresses',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        leading: Icon(
                          Icons.edit_location,
                          color: Colors.black,
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddAddress()));
                        },
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

}
void displayDialog(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text(
      'Confirm Sign Out',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    content: Text(
      'Do you really want to sign out?',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    actions: <Widget>[
      FlatButton(
        child: Text(
          'Cancel',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {
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
        onPressed: () {
          print("Signed Out");
          // Navigator.pop(context);
        },
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
