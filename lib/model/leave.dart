class Leave {
  int? id;
  int? userId;
  DateTime? date;
  int? status;

  Leave({this.id, this.userId, this.date, this.status});

  Leave.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'] != null ? DateTime.parse(json['date']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}
