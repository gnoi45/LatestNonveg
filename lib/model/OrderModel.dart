class OrderModel{
  String order_id, customer_id, product_id, order_status, payment_status, payment_id, mode,price,created_at;

  OrderModel({this.order_id, this.customer_id, this.product_id, this.order_status, this.payment_status, this.payment_id, this.mode, this.price,this.created_at});

  OrderModel.fromJSON(Map<String, dynamic> json){
    order_id = json['order_id'];
    customer_id = json['customer_id'];
    product_id = json['cart_id'];
    order_status = json['order_status'];
    payment_status = json['payment_status'];
    payment_id = json['payment_id'];
    mode = json['mode'];
    price = json['amount'];
    created_at=json['created_at'];
  }
}