class MyReview {
  MyReviewInfo? data;

  MyReview({this.data});

  MyReview.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? MyReviewInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MyReviewInfo {
  String? title;
  num? ratings;
  String? user;
  String? product;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MyReviewInfo(
      {this.title,
      this.ratings,
      this.user,
      this.product,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  MyReviewInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    ratings = json['ratings'];
    user = json['user'];
    product = json['product'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['ratings'] = ratings;
    data['user'] = user;
    data['product'] = product;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
