import 'package:flutter/material.dart';

class CancellationPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Cancellation Policy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(13, 13, 13, 0),
                child: Text(
                  "To cancel within 30 minutes of placing an order:",
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
                  "Please call our customer support team on ‪9599074024. Your order will be cancelled and the money refunded to you within 48-72 business hours after cancellation request.",
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
                  "Cancellation post shipment / delivery:",
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
                  "We are sorry that we are unable to cancel an order after it has been dispatched or delivered except in the case of a quality issue, or if the promised delivery time is not kept.",
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
                  "Return policy:",
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
                  "We strive to provide great customer experience each time you shop with us. If at all you are not 100% satisfied with your purchase, please let us know and we will take the best possible measures to resolve the issue.",
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
                  "In the unlikely case of any quality issue, we request you to contact our Customer Service team on ‪9599074024 and your order can be returned at no cost if it is Cash on Delivery (COD) terms of payment.",
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
                  "We do a 100% replacement in the case of damaged goods, quality issues, or error in delivery. Our quality team can consider complaints on case basis and use its discretion on such matters.",
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
                  "If we have delivered a wrong item, you have the right to reject the delivery and you will be fully refunded for the missing item. If we can only do a partial delivery (a few items might be not available), our staff will inform you or propose a replacement for missing items. You have the right to refuse a partial order before delivery and get a refund. We take responsibility for wrong / partial delivery.",
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
                  "Returns, Replacements, Damaged and Refunds",
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
                  "How do I return an item purchased on from Nonveghouse?",
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
                  "Nonveghouse offers its customers an '˜Easy Return policy'™, where you can raise a return / exchange request of a product within 30 minutes of placing your order. We also accept partial returns where you can raise a return request for one or all products in your order.",
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
                  "Step 1: Contact our Customer Support team via email (Support@nonveghouse.in) or call us at ‪9599074024 within 30 minutes of receiving the order.",
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
                  "Step 2: Provide us with your order ID details and your request to return / replace / refund your order. Kindly email an image of the product and the invoice for our reference.",
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
                  "Step 3: We will pick up the products within 1-2 hours of the same day. We will initiate the refund or replacement process only if the products are received by us in their original packaging with their seals, labels and barcodes intact.",
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
                  "Note: Replacement is subject to the availability of stock. In case a replacement is not available, we will refund you the full amount. Kindly refer to the next question for exclusions to refunds.",
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
                  "Which are the items that cannot be returned / exchanged?",
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
                  "Returns will not be accepted under the following conditions:",
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
                  "If original packaging is damaged or product is used\nProduct is returned without original packaging including price tags, labels and barcodes\nIf request is initiated after 30 minutes of placing the order",
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
                  "Can I return part of my order?",
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
                  "Yes. A return can be created at item level. If you have ordered multiple items, you can initiate a return / replacement / refund for any individual item. However, any product being returned needs to be returned in full including all components as well as any free gifts or products which came along with it.",
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
                  "How will my refund be made?",
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
                  "For payment by credit card, debit card or net banking, the refund will be processed to the same account from which the payment was made, within 48-72 business hours of us receiving the products back. It may take 2-3 additional business days for the amount to reflect in your account.\nFor Cash on Delivery (COD) transactions, Please call our customer support at ‪9599074024",
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
                  "When will I get my refund?",
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
                  "In case of cancellation before delivery, we process the refund within 48-72business hours after receiving the cancellation request.\n In case of cancellation once the order has already been dispatched or if it is being returned, we will process the refund once the products have been received and verified at our store.",
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
                  "What if I used discount vouchers or loyalty points during time of payment and I have to cancel my order?",
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
                  "Discount vouchers are intended for one-time use only and shall be treated as used even if you cancel the order.",
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
                  "If you had redeemed loyalty points for an order, the same will be credited back to your account in the case of a cancellation.",
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
                  "Nonveg House reserves the right to cancel any order if it suspects any fraudulent transaction or breaches in the terms and conditions of using the website.",
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