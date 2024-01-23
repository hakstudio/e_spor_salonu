class Purchase {
  int? id;
  int? userId;
  DateTime? date;
  String? product;
  int? amount;
  String? type;
  double? price;
  double? totalPrice;
  double? debt;
  double? paid;
  String? description;

  Purchase(
      {this.id,
        this.userId,
        this.date,
        this.product,
        this.amount,
        this.type,
        this.price,
        this.totalPrice,
        this.debt,
        this.paid,
        this.description});

  Purchase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'] != null ? DateTime.parse(json['date']) : null;
    product = json['product'];
    amount = json['amount'];
    type = json['type'];
    price = json['price'];
    totalPrice = json['totalPrice'];
    debt = json['debt'];
    paid = json['paid'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['date'] = this.date;
    data['product'] = this.product;
    data['amount'] = this.amount;
    data['type'] = this.type;
    data['price'] = this.price;
    data['totalPrice'] = this.totalPrice;
    data['debt'] = this.debt;
    data['paid'] = this.paid;
    data['description'] = this.description;
    return data;
  }
}
