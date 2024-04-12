class AllCouponsModel {
  int? results;
  PaginationResult? paginationResult;
  List<InfoEachCoupon>? data;

  AllCouponsModel({this.results, this.paginationResult, this.data});

  AllCouponsModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = <InfoEachCoupon>[];
      json['data'].forEach((v) {
        data!.add(InfoEachCoupon.fromJson(v));
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

class InfoEachCoupon {
  String? sId;
  String? name;
  String? expire;
  int? discount;
  String? createdAt;
  String? updatedAt;

  InfoEachCoupon(
      {this.sId,
      this.name,
      this.expire,
      this.discount,
      this.createdAt,
      this.updatedAt});

  InfoEachCoupon.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    expire = json['expire'];
    discount = json['discount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['expire'] = expire;
    data['discount'] = discount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
