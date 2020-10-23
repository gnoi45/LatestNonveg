import 'package:fipola_app/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pincode extends StatefulWidget {
  @override
  _PincodeState createState() => _PincodeState();
}
class _PincodeState extends State<Pincode> {
  final myController = TextEditingController();

  toastMessage(String toast) {
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
    return Scaffold(
      backgroundColor: Color(0xfffbd100),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Image.asset('assets/location.png', width: 100, height: 100,),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: TextField(
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
                    fillColor: Color(0xFFF2F3F5),
                    hintStyle: TextStyle(
                        color: Color(0xFF666666)),
                    hintText: "Enter Pincode",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  onPressed: (){
                    checkPinCode();
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkPinCode() {
    if(myController.text.isEmpty){
      toastMessage("Please enter pincode");
    }
    else if(myController.text.length != 6){
      toastMessage("Please enter valid pincode");
    }
    else if(myController.text == "841226" || myController.text == "841227"){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    else{
      alertDialog();
    }
  }

  void alertDialog() {
    var alertDialog = AlertDialog(
      title: Text(
        'Delivery Outside 841226 and 841227 is currently not available',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Ok',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
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
}
