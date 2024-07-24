

class UserDataModel {
  Data? data;

  UserDataModel({this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? tokshows;
  String? currentRoom;
  String? notificationToken;
  int? followersCount;
  String? sId;
  String? name;
  String? email;
  String? password;
  String? role;
  bool? active;
  List<String>? wishlist;
  List<String>? addresses;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.tokshows,
      this.currentRoom,
      this.notificationToken,
      this.followersCount,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.role,
      this.active,
      this.wishlist,
      this.addresses,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    tokshows = json['tokshows'];
    currentRoom = json['currentRoom'];
    notificationToken = json['notificationToken'];
    followersCount = json['followersCount'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
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
    data['tokshows'] = tokshows;
    data['currentRoom'] = currentRoom;
    data['notificationToken'] = notificationToken;
    data['followersCount'] = followersCount;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['active'] = active;
    data['wishlist'] = wishlist!.map((v) => v).toList();
    data['addresses'] = addresses!.map((v) => v).toList();
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
