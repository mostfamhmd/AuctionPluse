import 'dart:convert';

import 'room.dart';

class AllRoomsModel {
  List<Room>? rooms;
  int? totalDoc;
  int? limits;
  int? pages;

  AllRoomsModel({this.rooms, this.totalDoc, this.limits, this.pages});

  factory AllRoomsModel.fromJsonToDart(Map<String, dynamic> data) {
    return AllRoomsModel(
      rooms: (data['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJsonToRoom(e as Map<String, dynamic>))
          .toList(),
      totalDoc: data['totalDoc'] as int?,
      limits: data['limits'] as int?,
      pages: data['pages'] as int?,
    );
  }

  Map<String, dynamic> toAllRoomsModel() {
    return {
      'rooms': rooms?.map((e) => e.toRoom()).toList(),
      'totalDoc': totalDoc,
      'limits': limits,
      'pages': pages,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AllRoomsModel].
  factory AllRoomsModel.fromJson(String data) {
    return AllRoomsModel.fromJsonToDart(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AllRoomsModel] to a JSON string.
  String toJson() => json.encode(toAllRoomsModel());
}
