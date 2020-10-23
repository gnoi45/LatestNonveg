class CartModel{
  String cart_id, productID, added_date, product_title, image, product_sale_price, qty;

  CartModel({this.cart_id, this.productID, this.added_date, this.product_title, this.image, this.product_sale_price, this.qty});

  CartModel.fromJSON(Map<String, dynamic> json){
    cart_id = json['cart_id'];
    productID = json['productID'];
    added_date = json['added_date'];
    product_title = json['product_title'];
    image = json['image'];
    product_sale_price = json['product_sale_price'];
    qty = json['qauntity'];
  }
}