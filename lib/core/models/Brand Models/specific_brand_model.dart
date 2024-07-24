class SpecificBrandModel {
  SpecificBrandInfo? specificBrandInfo;

  SpecificBrandModel({this.specificBrandInfo});

  SpecificBrandModel.fromJson(Map<String, dynamic> json) {
    specificBrandInfo =
        json['data'] != null ? SpecificBrandInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (specificBrandInfo != null) {
      data['data'] = specificBrandInfo!.toJson();
    }
    return data;
  }
}

class SpecificBrandInfo {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SpecificBrandInfo(
      {this.sId,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SpecificBrandInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
