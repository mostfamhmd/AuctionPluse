class ProductsModel {
  int? results;
  PaginationResult? paginationResult;
  List<ProductInfo>? data;

  ProductsModel({this.results, this.paginationResult, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = <ProductInfo>[];
      json['data'].forEach((v) {
        data!.add(ProductInfo.fromJson(v));
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

class ProductInfo {
  String? sId;
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
  Category? category;
  List<String>? subcategories;
  String? description;
  String? ownerId;
  String? brand;
  int? ratingsQuantity;
  String? type;
  String? createdAt;
  String? updatedAt;
  dynamic ratingsAverage;
  String? id;

  ProductInfo(
      {this.sId,
      this.name,
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
      this.createdAt,
      this.updatedAt,
      this.ratingsAverage,
      this.id});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    subcategories = json['subcategories'].cast<String>();
    description = json['description'];
    ownerId = json['ownerId'];
    brand = json['brand'];
    ratingsQuantity = json['ratingsQuantity'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['subcategories'] = subcategories;
    data['description'] = description;
    data['ownerId'] = ownerId;
    data['brand'] = brand;
    data['ratingsQuantity'] = ratingsQuantity;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['ratingsAverage'] = ratingsAverage;
    data['id'] = id;
    return data;
  }
}

class Category {
  String? name;

  Category({this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }

  contains(String s) {}
}
