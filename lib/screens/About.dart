import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'About NonvegHouse',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(13, 13, 13, 0),
                child: Text(
                  "The first modern meat retail business for fresh proteins in India is NonvegHouse. Established in December 2020 by Mr. Anuj kumar, our goal is to redefine the country's meat retailing by providing premium products and best-in - class customer service in a hygienic and convenient shopping area.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(13, 13, 13, 0),
                child: Text(
                  "NonvegHouse offers a boundless selection of meats (fish/poultry/sheep), cuts and flavors. Our extraordinary range incorporates unfenced chicken and goat, close by a wide assortment of intriguing fish. In view of a multi-channel retail framework, NonvegHouse carries the best meats to your table. Our retail locations are current, cooled, clean and unscented making an unequaled meat shopping experience. To encourage client accommodation, we additionally utilize an internet business stage, Android and IOS applications for online requests and call-focus based doorstep conveyance.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(13, 13, 13, 0),
                child: Text(
                  "The organization follows a Farm to fork™ model under which stock is acquired straightforwardly from ranchers. Various checks are utilized right from sourcing the meat to pre-cleaning, handling and keeping up newness of the produce. Quality measures incorporate virus chain innovation for newness, rigid cycles of planning, bundling, and capacity to guarantee high caliber, clean items. Our in-house confirmed lab ensures substance and sans pesticide items. The nature of the meat and fish adjusts to HALAL, ISO, HACCP and FSSAI confirmation.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(13, 13, 13, 0),
                child: Text(
                  "The organization has an all around oversaw in reverse incorporation that disposes of the requirement for agents and guarantees quality items at the correct costs. The 350-part solid group is perhaps the greatest quality behind the activity. They accompany long periods of industry, retail and culinary aptitude.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(13, 13, 13, 10),
                child: Text(
                  "NonvegHouse is focused on leading business in a moral, lawful and socially dependable way by conveying quality and clean items to its clients and giving great facilitated,flexible work environment to the employees.Currently the organization gives work to 350 representatives. Around 350 roundabout poultry ranches are related with the organization allowing a chance to work for around 400-500 circuitous workers. By complete devotion and difficult work of the apparent multitude of representatives, the organization has had the option to cross the turnover of 110 crores for each annum.The organization's point is to create and flexibly great quality, cleanly prepared chicken and convey it to each kitchen.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
