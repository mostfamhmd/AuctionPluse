class ReviewModel {
  int? results;
  PaginationResult? paginationResult;
  List<Review>? data;

  ReviewModel({this.results, this.paginationResult, this.data});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = <Review>[];
      json['data'].forEach((v) {
        data!.add(Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results;
    if (paginationResult != null) {
      data['paginationResult'] = paginationResult!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaginationResult {
  int? currentPage;
  int? limit;
  int? numberOfPages;

  PaginationResult({this.currentPage, this.limit, this.numberOfPages});

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['limit'] = limit;
    data['numberOfPages'] = numberOfPages;
    return data;
  }
}

class Review {
  String? sId;
  num? ratings;
  User? user;
  String? product;
  String? createdAt;
  String? updatedAt;
  String? title;

  Review(
      {this.sId,
      this.ratings,
      this.user,
      this.product,
      this.createdAt,
      this.updatedAt,
      this.title});

  Review.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ratings = json['ratings'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    product = json['product'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['ratings'] = ratings;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['product'] = product;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['title'] = title;
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
