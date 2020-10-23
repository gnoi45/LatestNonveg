import 'dart:convert';

import 'package:fipola_app/model/Product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

import 'ProductDetail.dart';

Future<List<Product>> fetchPhotos(http.Client client) async {
  final response =
  await client.post('https://shopninja.in/nonveg/api2/public/index.php/getProductList');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Product> parsePhotos(String responseBody) {
  final parsed1 = jsonDecode(responseBody);
  final parsed=parsed1["msg"].cast<Map<String, dynamic>>();

  return parsed.map<Product>((json) => Product.fromJSON(json)).toList();
}



class Shop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? _FAQState(faqList: snapshot.data)
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

class _FAQState extends StatelessWidget {
  List<Product> faqList = List<Product>();

  _FAQState({Key key, this.faqList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Shop',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: _expansionPanel(),
    );
  }

  _expansionPanel(){
    return Container(
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(5, 7, 5, 0),
      child: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(value : Product(
//                  image: snapshot.data[index]["images"][0]["src"],
//                  title: snapshot.data[index]["name"],
//                  price: snapshot.data[index]["price"],
//                  desc: snapshot.data[index]["description"],
                  image: faqList[index].image,
                  title: faqList[index].title,
                  short_desc: faqList[index].short_desc,
                  long_desc: faqList[index].long_desc,
                  price: faqList[index].price,
                  id:faqList[index].id,
                ))));
              },
              child: Card(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Image(
//                          image: NetworkImage(snapshot.data[index]["images"][0]["src"]),
                          image: NetworkImage(faqList[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
//                          snapshot.data[index]["name"],
                          faqList[index].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Html(
                          data: faqList[index].short_desc,
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Peices',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Gross',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Net',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    child: Text(
                                      faqList[index].peices,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    child: Text(
                                      faqList[index].gross,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    child: Text(
                                      faqList[index].net,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
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
            ),
          );
        },
      ),
    );
  }
}
