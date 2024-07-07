class AuctionModel {
  String? sId;
  int? higestbid;
  Product? product;
  String? tokshow;
  int? baseprice;
  int? increaseBidBy;
  int? duration;
  int? startedTime;
  bool? sudden;
  bool? started;
  bool? ended;
  String? createdAt;
  String? updatedAt;
  int? iV;
  OwnerId? winner;

  AuctionModel(
      {this.sId,
      this.higestbid,
      this.product,
      this.tokshow,
      this.baseprice,
      this.increaseBidBy,
      this.duration,
      this.startedTime,
      this.sudden,
      this.started,
      this.ended,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.winner});

  AuctionModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    higestbid = json['higestbid'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    tokshow = json['tokshow'];
    baseprice = json['baseprice'];
    increaseBidBy = json['increaseBidBy'];
    duration = json['duration'];
    startedTime = json['startedTime'];
    sudden = json['sudden'];
    started = json['started'];
    ended = json['ended'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    winner = json['winner'] != null ? OwnerId.fromJson(json['winner']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['higestbid'] = higestbid;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['tokshow'] = tokshow;
    data['baseprice'] = baseprice;
    data['increaseBidBy'] = increaseBidBy;
    data['duration'] = duration;
    data['startedTime'] = startedTime;
    data['sudden'] = sudden;
    data['started'] = started;
    data['ended'] = ended;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (winner != null) {
      data['winner'] = product!.toJson();
    }
    return data;
  }
}

class Product {
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
  OwnerId? ownerId;
  String? brand;
  int? ratingsQuantity;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Product(
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
      this.iV,
      this.id});

  Product.fromJson(Map<String, dynamic> json) {
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
    ownerId =
        json['ownerId'] != null ? OwnerId.fromJson(json['ownerId']) : null;
    brand = json['brand'];
    ratingsQuantity = json['ratingsQuantity'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    if (ownerId != null) {
      data['ownerId'] = ownerId!.toJson();
    }
    data['brand'] = brand;
    data['ratingsQuantity'] = ratingsQuantity;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
}

class OwnerId {
  String? sId;
  String? name;
  String? email;

  OwnerId({
    this.sId,
    this.name,
    this.email,
  });

  OwnerId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
