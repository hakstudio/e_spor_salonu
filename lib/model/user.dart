class User {
  int? id;
  String? tc;
  String? name;
  String? surname;
  DateTime? birthDate;
  String? fathersName;
  String? mothersName;
  String? fathersPhone;
  String? mothersPhone;
  String? address;
  String? description;
  String? branch;
  String? subBranch;
  String? generation;
  String? coach;
  String? registrationDate;
  String? licenseId;
  String? status;
  int? licenseYear;
  int? dues;
  String? photo;

  User(
      {this.id,
        this.tc,
        this.name,
        this.surname,
        this.birthDate,
        this.fathersName,
        this.mothersName,
        this.fathersPhone,
        this.mothersPhone,
        this.address,
        this.description,
        this.branch,
        this.subBranch,
        this.generation,
        this.coach,
        this.registrationDate,
        this.licenseId,
        this.status,
        this.licenseYear,
        this.dues,
        this.photo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tc = json['tc'];
    name = json['name'];
    surname = json['surname'];
    birthDate = json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null;
    fathersName = json['fathersName'];
    mothersName = json['mothersName'];
    fathersPhone = json['fathersPhone'];
    mothersPhone = json['mothersPhone'];
    address = json['address'];
    description = json['description'];
    branch = json['branch'];
    subBranch = json['subBranch'];
    generation = json['generation'];
    coach = json['coach'];
    registrationDate = json['registrationDate'];
    licenseId = json['licenseId'];
    status = json['status'];
    licenseYear = json['licenseYear'];
    dues = json['dues'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tc'] = this.tc;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['birthDate'] = this.birthDate;
    data['fathersName'] = this.fathersName;
    data['mothersName'] = this.mothersName;
    data['fathersPhone'] = this.fathersPhone;
    data['mothersPhone'] = this.mothersPhone;
    data['address'] = this.address;
    data['description'] = this.description;
    data['branch'] = this.branch;
    data['subBranch'] = this.subBranch;
    data['generation'] = this.generation;
    data['coach'] = this.coach;
    data['registrationDate'] = this.registrationDate;
    data['licenseId'] = this.licenseId;
    data['status'] = this.status;
    data['licenseYear'] = this.licenseYear;
    data['dues'] = this.dues;
    data['photo'] = this.photo;
    return data;
  }
}
