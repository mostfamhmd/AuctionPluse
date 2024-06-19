import 'dart:convert';

class SpeakerId {
  String? id;
  String? email;

  SpeakerId({this.id, this.email});

  factory SpeakerId.fromJsonToSpeakerID(Map<String, dynamic> data) {
    return SpeakerId(
      id: data['_id'] as String?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toSpeakerID() {
    return {
      '_id': id,
      'email': email,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SpeakerId].
  factory SpeakerId.fromJson(String data) {
    return SpeakerId.fromJsonToSpeakerID(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SpeakerId] to a JSON string.
  String toJson() => json.encode(toSpeakerID());
}
