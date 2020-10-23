import 'package:fipola_app/screens/About.dart';
import 'package:fipola_app/screens/CancellationPolicy.dart';
import 'package:fipola_app/screens/Contact.dart';
import 'package:fipola_app/screens/FAQ.dart';
import 'package:fipola_app/screens/HomeScreen.dart';
import 'package:fipola_app/screens/OrderHistory.dart';
import 'package:fipola_app/screens/PrivacyPolicy.dart';
import 'package:fipola_app/screens/Profile.dart';
import 'package:fipola_app/screens/Shop.dart';
import 'package:fipola_app/screens/SignIn.dart';
import 'package:fipola_app/screens/Terms.dart';
import 'package:fipola_app/screens/Wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class navdrawer extends StatefulWidget {

  @override
  Navs createState() => Navs();
}

class Navs extends State<navdrawer> {
  String x_id = "";
  String name="";
  String email="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      int status = preferences.getInt("status");
      x_id = preferences.getString("id");
      name=preferences.getString("name");
      email=preferences.getString("email");
    });
  }

  Widget displayWidget(){
    if(x_id == null || x_id.isEmpty){
      return new ListTile(
        leading: Icon(Icons.exit_to_app, color: Colors.black,),
        title: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return new SignIn();
              }));
        },
      );
    }
    else if(x_id.isNotEmpty){
      return new ListTile(
        leading: Icon(Icons.exit_to_app, color: Colors.black,),
        title: Text(
          'Sign Out',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onTap: (){
          displayDialog(context);
        },
      );
    }
  }

  Widget displayHeader(){
    if(x_id == null || x_id.isEmpty){
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Hello Guest",
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
    }
    else if(x_id.isNotEmpty){
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      name,
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
                      email,
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
            signOut();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: ListView(
        children: [
          Column(
            children: [
              displayHeader(),
              ListTile(
                leading: Icon(Icons.shop, color: Colors.black,),
                title: Text(
                  'Shop',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Shop()));
                },
              ),
              ListTile(
                leading: Icon(Icons.history, color: Colors.black,),
                title: Text(
                  'Order History',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => OrderHistory()));

                  if (x_id == null || x_id.isEmpty) {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return new SignIn();
                        }));
                  } else if(x_id.isNotEmpty){
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return new OrderHistory();
                        }));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle, color: Colors.black,),
                title: Text(
                  'My Profile',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => Profile()));

                  if (x_id == null || x_id.isEmpty) {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return new SignIn();
                        }));
                  } else if(x_id.isNotEmpty){
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return new Profile();
                        }));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.black,),
                title: Text(
                  'FAQ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FAQ()));
                },
              ),
              ListTile(
                leading: Icon(Icons.people, color: Colors.black,),
                title: Text(
                  'About NonVegHouse',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => About()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.black,),
                title: Text(
                  'Terms & Policies',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Terms()));
                },
              ),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.black,),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel, color: Colors.black,),
                title: Text(
                  'Cancellation Policy',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CancellationPolicy()));
                },
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.black,),
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Contact()));
                },
              ),
              displayWidget(),
            ],
          ),
        ],
      ),
    );
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("value", null);
      preferences.setString("name", null);
      preferences.setString("email", null);
      preferences.setString("id", null);
      preferences.setInt("status", null);

      preferences.commit();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new SignIn();
          }));
    });
  }
}