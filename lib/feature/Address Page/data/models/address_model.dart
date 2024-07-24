class AddressModel {
  String? status;
  int? results;
  List<Data>? data;

  AddressModel({this.status, this.results, this.data});

  AddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['results'] = results;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? phone;
  String? city;
  String? sId;

  Data({this.phone, this.city, this.sId});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    city = json['city'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['city'] = city;
    data['_id'] = sId;
    return data;
  }
}
