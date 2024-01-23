class Product {
  int? id;
  int? userId;
  String? product;
  double? price;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? leaveStartDate;
  DateTime? leaveEndDate;

  Product(
      {this.id,
      this.userId,
      this.product,
      this.price,
      this.startDate,
      this.endDate,
      this.leaveStartDate,
      this.leaveEndDate});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    product = json['product'];
    price = json['price'];
    startDate =
        json['startDate'] != null ? DateTime.parse(json['startDate']) : null;
    endDate = json['endDate'] != null ? DateTime.parse(json['endDate']) : null;
    leaveStartDate = json['leaveStartDate'] != null
        ? DateTime.parse(json['leaveStartDate'])
        : null;
    leaveEndDate = json['leaveEndDate'] != null
        ? DateTime.parse(json['leaveEndDate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['product'] = this.product;
    data['price'] = this.price;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['leaveStartDate'] = this.leaveStartDate;
    data['leaveEndDate'] = this.leaveEndDate;
    return data;
  }
}
