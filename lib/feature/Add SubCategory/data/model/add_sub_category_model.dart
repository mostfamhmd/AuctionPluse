class AddSubCategoryModel {
  SubCategory? data;

  AddSubCategoryModel({this.data});

  AddSubCategoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? SubCategory.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SubCategory {
  String? name;
  String? slug;
  String? category;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SubCategory(
      {this.name,
      this.slug,
      this.category,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SubCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['category'] = category;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
