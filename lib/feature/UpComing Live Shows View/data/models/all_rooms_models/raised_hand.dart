import 'dart:convert';

class RaisedHand {
  String? id;
  String? email;

  RaisedHand({this.id, this.email});

  factory RaisedHand.fromJsonRaisedHand(Map<String, dynamic> data) {
    return RaisedHand(
      id: data['_id'] as String?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toRaisedHand() {
    return {
      '_id': id,
      'email': email,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RaisedHand].
  factory RaisedHand.fromJson(String data) {
    return RaisedHand.fromJsonRaisedHand(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RaisedHand] to a JSON string.
  String toJson() => json.encode(toRaisedHand());
}
