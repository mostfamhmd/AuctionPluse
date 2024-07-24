import 'dart:convert';

import 'host_id.dart';
import 'invited_id.dart';
import 'owner_id.dart';
import 'raised_hand.dart';
import 'speaker_id.dart';
import 'user_id.dart';

class Room {
  String? id;
  OwnerId? ownerId;
  List<ProductIds>? productIds;
  dynamic streamOptions;
  List<HostId>? hostIds;
  dynamic invitedhostIds;
  List<UserId>? userIds;
  dynamic pin;
  dynamic toBeNotified;
  String? title;
  List<RaisedHand>? raisedHands;
  List<SpeakerId>? speakerIds;
  dynamic invitedSpeakerIds;
  List<InvitedId>? invitedIds;
  dynamic allUsers;
  dynamic speakersSentNotifications;
  dynamic recordingIds;
  String? agoraToken;
  String? rtmToken;
  bool? event;
  int? eventDate;
  bool? status;
  int? discount;
  dynamic productPrice;
  String? description;
  String? resourceId;
  String? recordingUid;
  String? recordingsid;
  String? roomType;
  int? activeTime;
  bool? ended;
  bool? allowrecording;
  bool? allowchat;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Room({
    this.id,
    this.ownerId,
    this.productIds,
    this.streamOptions,
    this.hostIds,
    this.invitedhostIds,
    this.userIds,
    this.pin,
    this.toBeNotified,
    this.title,
    this.raisedHands,
    this.speakerIds,
    this.invitedSpeakerIds,
    this.invitedIds,
    this.allUsers,
    this.speakersSentNotifications,
    this.recordingIds,
    this.event,
    this.eventDate,
    this.status,
    this.discount,
    this.productPrice,
    this.description,
    this.resourceId,
    this.agoraToken,
    this.rtmToken,
    this.recordingUid,
    this.recordingsid,
    this.roomType,
    this.activeTime,
    this.ended,
    this.allowrecording,
    this.allowchat,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Room.fromJsonToRoom(Map<String, dynamic> data) {
    return Room(
      id: data['_id'] as String?,
      agoraToken: data['token'] as String?,
      rtmToken: data['RtmToken'] as String?,
      ownerId: data['ownerId'] == null
          ? null
          : OwnerId.fromJsonToOwnerID(data['ownerId'] as Map<String, dynamic>),
      productIds: (data['productIds'] as List<dynamic>?)
          ?.map((e) => ProductIds.fromJson(e as Map<String, dynamic>))
          .toList(),
      streamOptions: data['streamOptions'],
      hostIds: (data['hostIds'] as List<dynamic>?)
          ?.map((e) => HostId.fromJsonToHostID(e as Map<String, dynamic>))
          .toList(),
      invitedhostIds: data['invitedhostIds'],
      userIds: (data['userIds'] as List<dynamic>?)
          ?.map((e) => UserId.fromJsonToUserID(e as Map<String, dynamic>))
          .toList(),
      pin: data['pin'],
      toBeNotified: data['toBeNotified'],
      title: data['title'] as String?,
      raisedHands: (data['raisedHands'] as List<dynamic>?)
          ?.map((e) => RaisedHand.fromJsonRaisedHand(e as Map<String, dynamic>))
          .toList(),
      speakerIds: (data['speakerIds'] as List<dynamic>?)
          ?.map((e) => SpeakerId.fromJsonToSpeakerID(e as Map<String, dynamic>))
          .toList(),
      invitedSpeakerIds: data['invitedSpeakerIds'],
      invitedIds: (data['invitedIds'] as List<dynamic>?)
          ?.map((e) => InvitedId.fromJsonToInvitedID(e as Map<String, dynamic>))
          .toList(),
      allUsers: data['allUsers'],
      speakersSentNotifications: data['speakersSentNotifications'],
      recordingIds: data['recordingIds'],
      event: data['event'] as bool?,
      eventDate: data['eventDate'] as int?,
      status: data['status'] as bool?,
      discount: data['discount'] as int?,
      productPrice: data['productPrice'],
      description: data['description'] as String?,
      resourceId: data['resourceId'] as String?,
      recordingUid: data['recordingUid'] as String?,
      recordingsid: data['recordingsid'] as String?,
      roomType: data['roomType'] as String?,
      activeTime: data['activeTime'] as int?,
      ended: data['ended'] as bool?,
      allowrecording: data['allowrecording'] as bool?,
      allowchat: data['allowchat'] as bool?,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      v: data['__v'] as int?,
    );
  }
  Map<String, dynamic> toRoom() {
    return {
      '_id': id,
      'token': agoraToken,
      'RtmToken': rtmToken,
      'ownerId': ownerId?.toOwnerID(),
      'productIds': productIds,
      'streamOptions': streamOptions,
      'hostIds': hostIds?.map((e) => e.toHostID()).toList(),
      'invitedhostIds': invitedhostIds,
      'userIds': userIds?.map((e) => e.toUserID()).toList(),
      'pin': pin,
      'toBeNotified': toBeNotified,
      'title': title,
      'raisedHands': raisedHands?.map((e) => e.toRaisedHand()).toList(),
      'speakerIds': speakerIds?.map((e) => e.toSpeakerID()).toList(),
      'invitedSpeakerIds': invitedSpeakerIds,
      'invitedIds': invitedIds?.map((e) => e.toInvitedID()).toList(),
      'allUsers': allUsers,
      'speakersSentNotifications': speakersSentNotifications,
      'recordingIds': recordingIds,
      'event': event,
      'eventDate': eventDate,
      'status': status,
      'discount': discount,
      'productPrice': productPrice,
      'description': description,
      'resourceId': resourceId,
      'recordingUid': recordingUid,
      'recordingsid': recordingsid,
      'roomType': roomType,
      'activeTime': activeTime,
      'ended': ended,
      'allowrecording': allowrecording,
      'allowchat': allowchat,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Room].
  factory Room.fromJson(String data) {
    return Room.fromJsonToRoom(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Room] to a JSON string.
  String toJson() => json.encode(toRoom());
}

class ProductIds {
  String? sId;
  String? name;
  int? price;
  int? discountedPrice;
  int? quantity;
  bool? deleted;
  bool? available;
  bool? feature;
  String? imageCover;
  List<String>? images;
  List<String>? colors;
  Category? category;
  List<String>? subcategories;
  String? description;
  OwnerIdInfo? ownerId;
  String? brand;
  int? ratingsQuantity;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  ProductIds(
      {this.sId,
      this.name,
      this.price,
      this.discountedPrice,
      this.quantity,
      this.deleted,
      this.available,
      this.feature,
      this.imageCover,
      this.images,
      this.colors,
      this.category,
      this.subcategories,
      this.description,
      this.ownerId,
      this.brand,
      this.ratingsQuantity,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  ProductIds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    discountedPrice = json['discountedPrice'];
    quantity = json['quantity'];
    deleted = json['deleted'];
    available = json['available'];
    feature = json['feature'];
    imageCover = json['imageCover'];
    images = json['images'].cast<String>();
    colors = json['colors'].cast<String>();
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    subcategories = json['subcategories'].cast<String>();
    description = json['description'];
    ownerId =
        json['ownerId'] != null ? OwnerIdInfo.fromJson(json['ownerId']) : null;
    brand = json['brand'];
    ratingsQuantity = json['ratingsQuantity'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['price'] = price;
    data['discountedPrice'] = discountedPrice;
    data['quantity'] = quantity;
    data['deleted'] = deleted;
    data['available'] = available;
    data['feature'] = feature;
    data['imageCover'] = imageCover;
    data['images'] = images;
    data['colors'] = colors;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['subcategories'] = subcategories;
    data['description'] = description;
    if (ownerId != null) {
      data['ownerId'] = ownerId!.toJson();
    }
    data['brand'] = brand;
    data['ratingsQuantity'] = ratingsQuantity;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}

class Category {
  String? name;

  Category({this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class OwnerIdInfo {
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
  List<Addresses>? addresses;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OwnerIdInfo(
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

  OwnerIdInfo.fromJson(Map<String, dynamic> json) {
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
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
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
    data['wishlist'] = wishlist;
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Addresses {
  String? alias;
  String? details;
  String? phone;
  String? city;
  String? postalCode;
  String? sId;

  Addresses(
      {this.alias,
      this.details,
      this.phone,
      this.city,
      this.postalCode,
      this.sId});

  Addresses.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
    postalCode = json['postalCode'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alias'] = alias;
    data['details'] = details;
    data['phone'] = phone;
    data['city'] = city;
    data['postalCode'] = postalCode;
    data['_id'] = sId;
    return data;
  }
}
