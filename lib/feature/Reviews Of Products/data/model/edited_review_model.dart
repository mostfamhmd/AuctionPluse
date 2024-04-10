class EditReviewModel {
  InfoEditedReview? data;

  EditReviewModel({this.data});

  EditReviewModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? InfoEditedReview.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class InfoEditedReview {
  String? sId;
  String? title;
  num? ratings;
  User? user;
  String? product;
  String? createdAt;
  String? updatedAt;
  int? iV;

  InfoEditedReview(
      {this.sId,
      this.title,
      this.ratings,
      this.user,
      this.product,
      this.createdAt,
      this.updatedAt,
      this.iV});

  InfoEditedReview.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    ratings = json['ratings'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    product = json['product'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['ratings'] = ratings;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['product'] = product;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class User {
  String? sId;
  String? name;

  User({this.sId, this.name});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
