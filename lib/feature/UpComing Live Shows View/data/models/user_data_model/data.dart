import 'dart:convert';

class Data {
  String? notificationToken;
  int? followersCount;
  List<dynamic>? followers;
  List<dynamic>? following;
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  bool? active;
  int? tokshows;
  List<dynamic>? interests;
  List<dynamic>? channels;
  String? currentRoom;
  List<dynamic>? wishlist;
  List<dynamic>? addresses;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.notificationToken,
    this.followersCount,
    this.followers,
    this.following,
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.active,
    this.tokshows,
    this.interests,
    this.channels,
    this.currentRoom,
    this.wishlist,
    this.addresses,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJsonToUserData(Map<String, dynamic> data) {
    return Data(
      notificationToken: data['notificationToken'] as String?,
      followersCount: data['followersCount'] as int?,
      followers: data['followers'] as List<dynamic>?,
      following: data['following'] as List<dynamic>?,
      id: data['_id'] as String?,
      name: data['name'] as String?,
      email: data['email'] as String?,
      password: data['password'] as String?,
      role: data['role'] as String?,
      active: data['active'] as bool?,
      tokshows: data['tokshows'] as int?,
      interests: data['interests'] as List<dynamic>?,
      channels: data['channels'] as List<dynamic>?,
      currentRoom: data['currentRoom'] as String?,
      wishlist: data['wishlist'] as List<dynamic>?,
      addresses: data['addresses'] as List<dynamic>?,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      v: data['__v'] as int?,
    );
  }

  Map<String, dynamic> toDataUser() {
    return {
      'notificationToken': notificationToken,
      'followersCount': followersCount,
      'followers': followers,
      'following': following,
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'active': active,
      'tokshows': tokshows,
      'interests': interests,
      'channels': channels,
      'currentRoom': currentRoom,
      'wishlist': wishlist,
      'addresses': addresses,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromJsonToUserData(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toDataUser());
}
