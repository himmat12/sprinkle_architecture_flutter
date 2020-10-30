class ProductModel {
  String title;
  String image;
  String category;
  int qty;
  String description;
  String unit;
  int discount_amount;
  int discount_rate;
  int sale_amount;
  String refrence;

  ProductModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        image = json['image'],
        category = json['category'],
        qty = json['qty'],
        description = json['description'],
        unit = json['unit'],
        discount_amount = json['discount_amount'],
        discount_rate = json['discount_rate'],
        sale_amount = json['sale_price'],
        refrence = json['refrence'];
}
