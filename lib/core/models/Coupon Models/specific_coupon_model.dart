class SpecificCouponModel {
  InfoSpecificCoupon? data;

  SpecificCouponModel({this.data});

  SpecificCouponModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? InfoSpecificCoupon.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class InfoSpecificCoupon {
  String? sId;
  String? name;
  String? expire;
  int? discount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  InfoSpecificCoupon(
      {this.sId,
      this.name,
      this.expire,
      this.discount,
      this.createdAt,
      this.updatedAt,
      this.iV});

  InfoSpecificCoupon.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    expire = json['expire'];
    discount = json['discount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['expire'] = expire;
    data['discount'] = discount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
