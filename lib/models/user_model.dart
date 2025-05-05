class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? password;
  String? confirmPassword;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.password,
    this.confirmPassword,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    return data;
  }
}
