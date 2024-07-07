class OrdersModel {
  int? results;
  PaginationResult? paginationResult;
  List<Data>? data;

  OrdersModel({this.results, this.paginationResult, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? sId;
  User? user;
  List<CartItems>? cartItems;
  int? taxPrice;
  int? shippingPrice;
  int? totalOrderPrice;
  String? paymentMethodType;
  bool? isPaid;
  bool? isDelivered;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
      this.user,
      this.cartItems,
      this.taxPrice,
      this.shippingPrice,
      this.totalOrderPrice,
      this.paymentMethodType,
      this.isPaid,
      this.isDelivered,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['cartItems'] != null) {
      cartItems = <CartItems>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
    taxPrice = json['taxPrice'];
    shippingPrice = json['shippingPrice'];
    totalOrderPrice = json['totalOrderPrice'];
    paymentMethodType = json['paymentMethodType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (cartItems != null) {
      data['cartItems'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['taxPrice'] = taxPrice;
    data['shippingPrice'] = shippingPrice;
    data['totalOrderPrice'] = totalOrderPrice;
    data['paymentMethodType'] = paymentMethodType;
    data['isPaid'] = isPaid;
    data['isDelivered'] = isDelivered;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;

  User({this.sId, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
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

class CartItems {
  Product? product;
  int? quantity;
  String? color;
  int? price;
  String? sId;

  CartItems({this.product, this.quantity, this.color, this.price, this.sId});

  CartItems.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    color = json['color'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    data['color'] = color;
    data['price'] = price;
    data['_id'] = sId;
    return data;
  }
}

class Product {
  String? sId;
  String? imageCover;
  Category? category;
  String? id;

  Product({this.sId, this.imageCover, this.category, this.id});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['imageCover'] = imageCover;
    if (category != null) {
      data['category'] = category!.toJson();
    }
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
