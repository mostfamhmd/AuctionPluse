class NewEventModel {
  NewRoom? newRoom;

  NewEventModel({this.newRoom});

  NewEventModel.fromJson(Map<String, dynamic> json) {
    newRoom =
        json['newRoom'] != null ? NewRoom.fromJson(json['newRoom']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (newRoom != null) {
      data['newRoom'] = newRoom!.toJson();
    }
    return data;
  }
}

class NewRoom {
  String? ownerId;
  List<String>? productIds;
  List<String>? hostIds;
  List<String>? userIds;
  String? title;
  List<String>? allUsers;
  bool? event;
  int? eventDate;
  bool? status;
  int? discount;
  List<String>? productPrice;
  String? description;
  String? resourceId;
  String? recordingUid;
  String? recordingsid;
  String? roomType;
  int? activeTime;
  bool? ended;
  bool? allowrecording;
  bool? allowchat;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? agoraToken;
  String? rtmToken;

  NewRoom({
    this.ownerId,
    this.productIds,
    this.hostIds,
    this.userIds,
    this.title,
    this.allUsers,
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
    this.sId,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.agoraToken,
    this.rtmToken,
  });

  NewRoom.fromJson(Map<String, dynamic> json) {
    ownerId = json['ownerId'];
    productIds = json['productIds'].cast<String>();
    agoraToken = json['token'];
    rtmToken = json['RtmToken'];
    hostIds = json['hostIds'].cast<String>();
    userIds = json['userIds'].cast<String>();
    title = json['title'];
    allUsers = json['allUsers'].cast<String>();
    event = json['event'];
    eventDate = json['eventDate'];
    status = json['status'];
    discount = json['discount'];
    productPrice = json['productPrice'].cast<String>();
    description = json['description'];
    resourceId = json['resourceId'];
    recordingUid = json['recordingUid'];
    recordingsid = json['recordingsid'];
    roomType = json['roomType'];
    activeTime = json['activeTime'];
    ended = json['ended'];
    allowrecording = json['allowrecording'];
    allowchat = json['allowchat'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ownerId'] = ownerId;
    data['token'] = agoraToken;
    data['RtmToken'] = rtmToken;
    data['productIds'] = productIds;
    data['hostIds'] = hostIds;
    data['userIds'] = userIds;
    data['title'] = title;
    data['allUsers'] = allUsers;
    data['event'] = event;
    data['eventDate'] = eventDate;
    data['status'] = status;
    data['discount'] = discount;
    data['productPrice'] = productPrice;
    data['description'] = description;
    data['resourceId'] = resourceId;
    data['recordingUid'] = recordingUid;
    data['recordingsid'] = recordingsid;
    data['roomType'] = roomType;
    data['activeTime'] = activeTime;
    data['ended'] = ended;
    data['allowrecording'] = allowrecording;
    data['allowchat'] = allowchat;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
