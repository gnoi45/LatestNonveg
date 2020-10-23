class AddressModel{
  String cust_id, plotNo, street, area, city, state, pincode;

  AddressModel({this.cust_id, this.plotNo, this.street, this.area, this.city, this.state, this.pincode});

  AddressModel.fromJSON(Map<String, dynamic> json){
    cust_id = json['cust_id'];
    plotNo = json['plot_no'];
    street = json['street'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }
}