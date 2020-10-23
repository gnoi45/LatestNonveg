import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Terms & Policies',
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
                  "Coming up next are the conditions of a help understanding between any client ('You' or 'Client' or 'Client') of this site www.nonveghouse.com (the 'Site') and NonvegHouse India Pvt Ltd ('NonvegHouse'). By getting to, perusing, and utilizing this site or requesting items from the site you recognize having perused, comprehended and thus consent to be limited by these terms and conditions, as altered or corrected occasionally and each time you access the site, you reconfirm your arrangement. NonvegHouse maintains all authority to change or reexamine the terms and states of this Agreement whenever by posting any progressions or a reconsidered concurrence on this site. This Website offers available to be purchased sure items (the 'Items'). By putting in a request for Products through this Website, you consent to the terms set out in this Agreement. This Terms of Service Agreement (the 'Arrangement') oversees your utilization of this Website, the proposal of items for buy on this Website, and your acquisition of items accessible on this Website.",
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
                  "Except if you inform our outsider merchants or direct NonvegHouse counselors, of your craving to quit from further direct organization correspondences and sales, you are consenting to keep on accepting further messages and call requesting from NonvegHouse and its assigned in house or outsider sellers.",
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
                  "Clients are allowed restricted admittance rights for individual use on this App and not to download or alter any part of it. NonvegHouse isn't liable for any harms coming about because of utilization of this site by anybody. You won't utilize the App for unlawful or false purposes. You will (1) keep all relevant neighborhood, state, public, and worldwide laws and guidelines in your utilization of the Website (counting laws in regards to protected innovation), (2) give valid, exact, current and complete data, (3) not take any activities that will disregard or endeavor to disregard the security of the Website, (4) not draw in, straightforwardly or in a roundabout way, in transmission of 'spam', networking letters, garbage mail or some other sort of spontaneous correspondence, and (5) not slander, disturb, misuse, or meddle with some other individual's utilization or satisfaction in the app.",
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
                  "NonvegHouse claims all authority to erase, change, or supplement the substance of the App whenever under any conditions without earlier notice, and will go through sensible endeavors to incorporate to-date and exact data on the Website. NonvegHouse claims unlimited authority to alter terms and states of executing business with no earlier notice and assent of clients. In the event that we make changes to our Terms of Use and Privacy Policy and you keep on utilizing our Website, you are certainly consenting to the corrected Terms of Use and Privacy Policy. Except if determined something else, any such erasures or changes will be taking effect right now upon NonvegHouse's posting thereof. Proceeded with utilization of the app will be regarded to comprise acknowledgment of the new terms and conditions.",
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
                  "NonvegHouse maintains whatever authority is needed to end your admittance to the Website without early notification in the event that it sensibly accepts, in its sole prudence, that you have penetrated any of the terms and states of this Agreement. Following end, you won't be allowed to utilize the Website and NonvegHouse may, in its sole circumspection and without early notification to you, drop any exceptional requests for Products. On the off chance that your admittance to the app is ended, NonvegHouse claims all authority to practice whatever implies important to forestall unapproved access of the Website. NonvegHouse may whenever, in its sole prudence and without notification ahead of time to you, stop activity of the app and conveyance of the Products.",
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