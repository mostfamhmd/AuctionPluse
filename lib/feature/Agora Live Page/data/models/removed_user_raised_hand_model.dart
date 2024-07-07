class RemoveUserRaisedHandModel {
  String? sId;
  String? ownerId;
  List<String>? productIds;
  List<String>? hostIds;
  List<String>? invitedhostIds;
  List<String>? userIds;
  String? title;
  List<String>? raisedHands;
  List<String>? speakerIds;
  List<String>? invitedSpeakerIds;
  List<String>? invitedIds;
  List<String>? allUsers;
  List<String>? speakersSentNotifications;
  List<String>? recordingIds;
  bool? event;
  int? eventDate;
  bool? status;
  int? discount;
  String? token;
  String? rtmToken;
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

  RemoveUserRaisedHandModel(
      {this.sId,
      this.ownerId,
      this.productIds,
      this.hostIds,
      this.invitedhostIds,
      this.userIds,
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
      this.token,
      this.rtmToken,
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
      this.iV});

  RemoveUserRaisedHandModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ownerId = json['ownerId'];
    productIds = json['productIds'].cast<String>();
    hostIds = json['hostIds'].cast<String>();
    invitedhostIds = json['invitedhostIds'].cast<String>();
    userIds = json['userIds'].cast<String>();
    title = json['title'];
    raisedHands = json['raisedHands'].cast<String>();
    speakerIds = json['speakerIds'].cast<String>();
    invitedSpeakerIds = json['invitedSpeakerIds'].cast<String>();
    invitedIds = json['invitedIds'].cast<String>();
    allUsers = json['allUsers'].cast<String>();
    speakersSentNotifications =
        json['speakersSentNotifications'].cast<String>();
    recordingIds = json['recordingIds'].cast<String>();
    event = json['event'];
    eventDate = json['eventDate'];
    status = json['status'];
    discount = json['discount'];
    token = json['token'];
    rtmToken = json['RtmToken'];
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
    data['ownerId'] = ownerId;
    data['productIds'] = productIds;
    data['hostIds'] = hostIds;
    data['invitedhostIds'] = invitedhostIds;
    data['userIds'] = userIds;
    data['title'] = title;
    data['raisedHands'] = raisedHands;
    data['speakerIds'] = speakerIds;
    data['invitedSpeakerIds'] = invitedSpeakerIds;
    data['invitedIds'] = invitedIds;
    data['allUsers'] = allUsers;
    data['speakersSentNotifications'] = speakersSentNotifications;
    data['recordingIds'] = recordingIds;
    data['event'] = event;
    data['eventDate'] = eventDate;
    data['status'] = status;
    data['discount'] = discount;
    data['token'] = token;
    data['RtmToken'] = rtmToken;
    data['description'] = description;
    data['resourceId'] = resourceId;
    data['recordingUid'] = recordingUid;
    data['recordingsid'] = recordingsid;
    data['roomType'] = roomType;
    data['activeTime'] = activeTime;
    data['ended'] = ended;
    data['allowrecording'] = allowrecording;
    data['event'] = event;
    data['allowchat'] = allowchat;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
