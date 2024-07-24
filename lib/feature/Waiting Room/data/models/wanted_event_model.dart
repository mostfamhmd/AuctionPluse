import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

class WantedEventModel {
  String? sId;
  OwnerId? ownerId;
  List<ProductIds>? productIds;
  List<HostIds>? hostIds;
  List<InvitedhostIds>? invitedhostIds;
  List<InvitedhostIds>? userIds;
  bool? pin;
  String? title;
  List<InvitedhostIds>? raisedHands;
  List<InvitedhostIds>? speakerIds;
  List<InvitedhostIds>? invitedSpeakerIds;
  List<InvitedhostIds>? invitedIds;
  bool? event;
  int? eventDate;
  bool? status;
  int? discount;
  List<ProductInfo>? productPrice;
  String? description;
  String? resourceId;
  String? recordingUid;
  String? recordingsid;
  String? roomType;
  int? activeTime;
  bool? ended;
  bool? allowrecording;
  bool? allowchat;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? agoraToken;
  String? rtmToken;

  WantedEventModel({
    this.sId,
    this.ownerId,
    this.productIds,
    this.hostIds,
    this.invitedhostIds,
    this.userIds,
    this.pin,
    this.title,
    this.raisedHands,
    this.speakerIds,
    this.invitedSpeakerIds,
    this.invitedIds,
    this.event,
    this.eventDate,
    this.status,
    this.discount,
    this.productPrice,
    this.description,
    this.resourceId,
    this.recordingUid,
    this.recordingsid,
    this.roomType,
    this.activeTime,
    this.ended,
    this.allowrecording,
    this.allowchat,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.agoraToken,
    this.rtmToken,
  });

  WantedEventModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    agoraToken = json['token'];
    rtmToken = json['RtmToken'];
    ownerId =
        json['ownerId'] != null ? OwnerId.fromJson(json['ownerId']) : null;
    if (json['productIds'] != null) {
      productIds = <ProductIds>[];
      json['productIds'].forEach((v) {
        productIds!.add(ProductIds.fromJson(v));
      });
    }
    if (json['hostIds'] != null) {
      hostIds = <HostIds>[];
      json['hostIds'].forEach((v) {
        hostIds!.add(HostIds.fromJson(v));
      });
    }
    if (json['invitedhostIds'] != null) {
      invitedhostIds = <InvitedhostIds>[];
      json['invitedhostIds'].forEach((v) {
        invitedhostIds!.add(InvitedhostIds.fromJson(v));
      });
    }
    if (json['userIds'] != null) {
      userIds = <InvitedhostIds>[];
      json['userIds'].forEach((v) {
        userIds!.add(InvitedhostIds.fromJson(v));
      });
    }
    pin = json['pin'];
    title = json['title'];
    if (json['raisedHands'] != null) {
      raisedHands = <InvitedhostIds>[];
      json['raisedHands'].forEach((v) {
        raisedHands!.add(InvitedhostIds.fromJson(v));
      });
    }
    if (json['speakerIds'] != null) {
      speakerIds = <InvitedhostIds>[];
      json['speakerIds'].forEach((v) {
        speakerIds!.add(InvitedhostIds.fromJson(v));
      });
    }
    if (json['invitedSpeakerIds'] != null) {
      invitedSpeakerIds = <InvitedhostIds>[];
      json['invitedSpeakerIds'].forEach((v) {
        invitedSpeakerIds!.add(InvitedhostIds.fromJson(v));
      });
    }
    if (json['invitedIds'] != null) {
      invitedIds = <InvitedhostIds>[];
      json['invitedIds'].forEach((v) {
        invitedIds!.add(InvitedhostIds.fromJson(v));
      });
    }
    event = json['event'];
    eventDate = json['eventDate'];
    status = json['status'];
    discount = json['discount'];
    if (json['productPrice'] != null) {
      productPrice = <ProductInfo>[];
      json['productPrice'].forEach((v) {
        productPrice!.add(ProductInfo.fromJson(v));
      });
    }
    description = json['description'];
    resourceId = json['resourceId'];
    recordingUid = json['recordingUid'];
    recordingsid = json['recordingsid'];
    roomType = json['roomType'];
    activeTime = json['activeTime'];
    ended = json['ended'];
    allowrecording = json['allowrecording'];
    allowchat = json['allowchat'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['token'] = agoraToken;
    data['RtmToken'] = rtmToken;
    if (ownerId != null) {
      data['ownerId'] = ownerId!.toJson();
    }
    if (productIds != null) {
      data['productIds'] = productIds!.map((v) => v.toJson()).toList();
    }
    if (hostIds != null) {
      data['hostIds'] = hostIds!.map((v) => v.toJson()).toList();
    }
    if (invitedhostIds != null) {
      data['invitedhostIds'] = invitedhostIds!.map((v) => v.toJson()).toList();
    }
    if (userIds != null) {
      data['userIds'] = userIds!.map((v) => v.toJson()).toList();
    }
    data['pin'] = pin;
    data['title'] = title;
    if (raisedHands != null) {
      data['raisedHands'] = raisedHands!.map((v) => v.toJson()).toList();
    }
    if (speakerIds != null) {
      data['speakerIds'] = speakerIds!.map((v) => v.toJson()).toList();
    }
    if (invitedSpeakerIds != null) {
      data['invitedSpeakerIds'] =
          invitedSpeakerIds!.map((v) => v.toJson()).toList();
    }
    if (invitedIds != null) {
      data['invitedIds'] = invitedIds!.map((v) => v.toJson()).toList();
    }
    data['event'] = event;
    data['eventDate'] = eventDate;
    data['status'] = status;
    data['discount'] = discount;
    if (productPrice != null) {
      data['productPrice'] = productPrice!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['resourceId'] = resourceId;
    data['recordingUid'] = recordingUid;
    data['recordingsid'] = recordingsid;
    data['roomType'] = roomType;
    data['activeTime'] = activeTime;
    data['ended'] = ended;
    data['allowrecording'] = allowrecording;
    data['allowchat'] = allowchat;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class OwnerId {
  String? sId;
  String? name;
  String? email;

  OwnerId({this.sId, this.name, this.email});

  OwnerId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class HostIds {
  String? sId;
  String? name;
  String? email;

  HostIds({this.sId, this.name, this.email});

  HostIds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class InvitedhostIds {
  String? sId;
  String? name;
  String? email;

  InvitedhostIds({this.sId, this.name, this.email});

  InvitedhostIds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
