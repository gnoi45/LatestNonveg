import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FAQ extends StatelessWidget {
  final questions = ["Where is your office?", "Is your meat safe?", "How long will it take to deliver?", "Is your meat fresh or frozen?", "Can I cancel my order?", "From where do you get your meat?", "How do I pay?", "What's your returns policy if I don't like your product?", "How do I check the current status of my order?", "When and how can I cancel an order?", "How do I contact Customer Support?"];
  final answers = ["We are a Bihar-based company and our corporate office is located at StationRoad.", "Our meat is 100% safe, clean and hygienic. We are certified by HACCP, FSSAI and our meat is HALAL certified too.", "depending on traffic and road conditions it may take within 120 mins from the time of ordering.", "We have both Fresh as well as a range of frozen meats. Most of the meat is fresh.", "If you have placed your order within the past 30 mins; We will do our best to communicate to the concerned store and cancel your order. Please allow us to check with the concerned department regarding the status of your order and call you back with possibilities.", "All our meat is sourced directly from the farmers and the local fishing communities on a daily basis and is completely fresh. They adhere to our strict operating procedures and certifications to ensure hygienic, tasty and tender meat.", "You may choose to pay by cash/credit or debit cards at the time of delivery. Alternatively, you may also place your order online and pay in advance for the same.", "We assure you that you will like our products once you try. Since ours is a highly perishable product we will not be able to entertain any returns. However, in case of any dissatisfaction with our product; please feel free to get in touch with us, We will be able to give you an Instant replacement", "You can track your order live from your My Orders page .", "You can call us or email us", "Our customer service team is available all days of the week - 8:00 AM to 8:00 PM. You can reach the team @ ‪9599074024."];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'FAQ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(12, 10, 12,0),
                  child: Text(
                    questions[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(12, 4, 12,10),
                  child: Text(
                    'Ans: ' + answers[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}