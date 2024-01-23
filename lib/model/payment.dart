class Payment {
  int? id;
  int? userId;
  DateTime? date;
  String? period;
  String? type;
  double? debt;
  double? paid;
  double? remaining;
  String? description;

  Payment(
      {this.id,
      this.userId,
      this.date,
      this.period,
      this.type,
      this.debt,
      this.paid,
      this.remaining,
      this.description});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'] != null ? DateTime.parse(json['date']) : null;
    period = json['period'];
    type = json['type'];
    debt = json['debt'];
    paid = json['paid'];
    remaining = json['remaining'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['date'] = this.date;
    data['period'] = this.period;
    data['type'] = this.type;
    data['debt'] = this.debt;
    data['paid'] = this.paid;
    data['remaining'] = this.remaining;
    data['description'] = this.description;
    return data;
  }
}
