import 'dart:convert';

import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/host_id.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/invited_id.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/raised_hand.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/speaker_id.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/user_id.dart';

class WantedRoomModel {
  String? id;
  String? ownerId;
  dynamic productIds;
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

  WantedRoomModel({
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

  factory WantedRoomModel.fromJsonToRoom(Map<String, dynamic> data) {
    return WantedRoomModel(
      id: data['_id'] as String?,
      agoraToken: data['token'] as String?,
      rtmToken: data['RtmToken'] as String?,
      ownerId: data['ownerId'] as String?,
      productIds: data['productIds'],
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
      'ownerId': ownerId,
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
  factory WantedRoomModel.fromJson(String data) {
    return WantedRoomModel.fromJsonToRoom(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Room] to a JSON string.
  String toJson() => json.encode(toRoom());
}
