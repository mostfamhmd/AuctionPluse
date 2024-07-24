class AddProductModel {
  bool? success;
  Product? data;

  AddProductModel({this.success, this.data});

  AddProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Product.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Product {
  String? name;
  int? price;
  int? discountedPrice;
  int? quantity;
  bool? deleted;
  bool? available;
  bool? feature;
  String? imageCover;
  List<String>? images;
  List<String>? colors;
  String? category;
  List<String>? subcategories;
  String? description;
  String? ownerId;
  String? brand;
  int? ratingsQuantity;
  String? type;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Product(
      {this.name,
      this.price,
      this.discountedPrice,
      this.quantity,
      this.deleted,
      this.available,
      this.feature,
      this.imageCover,
      this.images,
      this.colors,
      this.category,
      this.subcategories,
      this.description,
      this.ownerId,
      this.brand,
      this.ratingsQuantity,
      this.type,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    discountedPrice = json['discountedPrice'];
    quantity = json['quantity'];
    deleted = json['deleted'];
    available = json['available'];
    feature = json['feature'];
    imageCover = json['imageCover'];
    images = json['images'].cast<String>();
    colors = json['colors'].cast<String>();
    category = json['category'];
    subcategories = json['subcategories'].cast<String>();
    description = json['description'];
    ownerId = json['ownerId'];
    brand = json['brand'];
    ratingsQuantity = json['ratingsQuantity'];
    type = json['type'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['discountedPrice'] = discountedPrice;
    data['quantity'] = quantity;
    data['deleted'] = deleted;
    data['available'] = available;
    data['feature'] = feature;
    data['imageCover'] = imageCover;
    data['images'] = images;
    data['colors'] = colors;
    data['category'] = category;
    data['subcategories'] = subcategories;
    data['description'] = description;
    data['ownerId'] = ownerId;
    data['brand'] = brand;
    data['ratingsQuantity'] = ratingsQuantity;
    data['type'] = type;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}
