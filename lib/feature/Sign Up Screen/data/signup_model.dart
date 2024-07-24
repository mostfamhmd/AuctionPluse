class SignUpData {
  Data? data;
  String? token;

  SignUpData({this.data, this.token});

  SignUpData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? passwordConfirm;
  String? role;
  bool? active;
  List<String>? wishlist;
  List<String>? addresses;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.name,
      this.email,
      this.passwordConfirm,
      this.role,
      this.active,
      this.wishlist,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    passwordConfirm = json['passwordConfirm'];
    role = json['role'];
    active = json['active'];
    wishlist = json['wishlist'].cast<String>();
    addresses = json['addresses'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['passwordConfirm'] = passwordConfirm;
    data['role'] = role;
    data['active'] = active;
    data['wishlist'] = wishlist;
    data['addresses'] = addresses;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
