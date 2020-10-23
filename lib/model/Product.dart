class Product{
  String title, short_desc, long_desc, image, peices, gross, net,price,id;

  Product({this.title, this.short_desc, this.long_desc, this.image, this.peices, this.gross, this.net, this.price,this.id});

  Product.fromJSON(Map<String, dynamic> json){
    title = json['product_title'];
    short_desc = json['short_description'];
    long_desc = json['long_description'];
    image = json['image'];
    price = json['product_sale_price'];
    id=json['id'];
    peices = json['pieces'];
    gross = json['gross'];
    net = json['net'];
  }
}