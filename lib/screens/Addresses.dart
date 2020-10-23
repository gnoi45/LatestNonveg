import 'dart:convert';

import 'package:fipola_app/model/AddressModel.dart';
import 'package:fipola_app/model/CartModel.dart';
import 'package:fipola_app/screens/AddAddress.dart';
import 'package:fipola_app/screens/OrderSuccessful.dart';
import 'package:fipola_app/utils/AppUrl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String xx_id="";
Future<List<AddressModel>> fetchPhotos(http.Client client) async {
  final response =
  await client.post('https://shopninja.in/nonveg/api2/public/index.php/getAllAddress', body: {
    "user_id": ""+xx_id,
  });

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<AddressModel> parsePhotos(String responseBody) {
  final parsed1 = jsonDecode(responseBody);
  final parsed=parsed1["msg"].cast<Map<String, dynamic>>();

  return parsed.map<AddressModel>((json) => AddressModel.fromJSON(json)).toList();
}

toastMessage(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white
  );
}


class Addresses extends StatefulWidget
{

  @override
  Address createState() => Address();
}

class Address extends State<Addresses> {
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
      xx_id = preferences.getString("id");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AddressModel>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? AddressState(addressList: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _FAQState();
//  }

}

class AddressState extends StatelessWidget {

  List<AddressModel> addressList = List<AddressModel>();

  AddressState({Key key, this.addressList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Addresses',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddAddress()));
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.add_circle_outline),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                itemCount: addressList.length,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(addressList[index].plotNo + ", " + addressList[index].street, style: TextStyle(fontSize: 16,),),
                        ),
                        Container(
                          child: Text(addressList[index].area + ", " + addressList[index].city, style: TextStyle(fontSize: 16,),),
                        ),
                        Container(
                          child: Text(addressList[index].state + ",", style: TextStyle(fontSize: 16,),),
                        ),
                        Container(
                          child: Text(addressList[index].pincode, style: TextStyle(fontSize: 16,),),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
