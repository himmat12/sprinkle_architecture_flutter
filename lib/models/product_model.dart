class ProductModel {
  String title;
  String category;
  int qty;
  String description;
  String uint;
  double discount_amount;
  int discount_rate;
  double sale_amount;
  String refrence;

  ProductModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        category = json['category'],
        qty = json['qty'],
        description = json['description'],
        uint = json['uint'],
        discount_amount = json['discount_amount'],
        discount_rate = json['discount_rate'],
        sale_amount = json['sale_amount'],
        refrence = json['refrence'];
}
