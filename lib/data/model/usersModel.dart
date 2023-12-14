class UsersModel {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phoneNumber;

  String? createdAt;
  String? updatedAt;

  UsersModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.phoneNumber,

      this.createdAt,
      this.updatedAt});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstName'];
    lastname = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstname;
    data['lastName'] = this.lastname;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}