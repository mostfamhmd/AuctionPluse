class AllUsersModel {
  int? results;
  PaginationResult? paginationResult;
  List<AllUsers>? data;

  AllUsersModel({this.results, this.paginationResult, this.data});

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = <AllUsers>[];
      json['data'].forEach((v) {
        data!.add(AllUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results;
    if (paginationResult != null) {
      data['paginationResult'] = paginationResult!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaginationResult {
  int? currentPage;
  int? limit;
  int? numberOfPages;
  int? next;

  PaginationResult(
      {this.currentPage, this.limit, this.numberOfPages, this.next});

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['limit'] = limit;
    data['numberOfPages'] = numberOfPages;
    data['next'] = next;
    return data;
  }
}

class AllUsers {
  int? tokshows;
  String? currentRoom;
  String? notificationToken;
  int? followersCount;
  String? sId;
  String? name;
  String? email;
  String? password;
  String? passwordConfirm;
  String? role;
  bool? active;
  List<String>? wishlist;
  List<Addresses>? addresses;
  String? createdAt;
  String? updatedAt;
  String? passwordResetCode;
  String? passwordResetExpires;
  bool? passwordResetVerified;
  String? passwordChangedAt;
  String? phone;
  String? slug;

  AllUsers(
      {this.tokshows,
      this.currentRoom,
      this.notificationToken,
      this.followersCount,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.passwordConfirm,
      this.role,
      this.active,
      this.wishlist,
      this.addresses,
      this.createdAt,
      this.updatedAt,
      this.passwordResetCode,
      this.passwordResetExpires,
      this.passwordResetVerified,
      this.passwordChangedAt,
      this.phone,
      this.slug});

  AllUsers.fromJson(Map<String, dynamic> json) {
    tokshows = json['tokshows'];
    currentRoom = json['currentRoom'];
    notificationToken = json['notificationToken'];
    followersCount = json['followersCount'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
    role = json['role'];
    active = json['active'];
    wishlist = json['wishlist'].cast<String>();
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    passwordResetCode = json['passwordResetCode'];
    passwordResetExpires = json['passwordResetExpires'];
    passwordResetVerified = json['passwordResetVerified'];
    passwordChangedAt = json['passwordChangedAt'];
    phone = json['phone'];
    slug = json['slug'];
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
    data['passwordConfirm'] = passwordConfirm;
    data['role'] = role;
    data['active'] = active;
    data['wishlist'] = wishlist;
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['passwordResetCode'] = passwordResetCode;
    data['passwordResetExpires'] = passwordResetExpires;
    data['passwordResetVerified'] = passwordResetVerified;
    data['passwordChangedAt'] = passwordChangedAt;
    data['phone'] = phone;
    data['slug'] = slug;
    return data;
  }
}

class Addresses {
  String? sId;

  Addresses({this.sId});

  Addresses.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    return data;
  }
}
