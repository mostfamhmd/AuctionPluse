class AddedProductModel {
  String? status;
  String? message;
  int? numOfCartItems;
  AddedProductInfo? data;

  AddedProductModel(
      {this.status, this.message, this.numOfCartItems, this.data});

  AddedProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data =
        json['data'] != null ? AddedProductInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['numOfCartItems'] = numOfCartItems;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddedProductInfo {
  String? sId;
  List<CartItems>? cartItems;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  AddedProductInfo(
      {this.sId,
      this.cartItems,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});

  AddedProductInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['cartItems'] != null) {
      cartItems = <CartItems>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (cartItems != null) {
      data['cartItems'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['user'] = user;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['totalCartPrice'] = totalCartPrice;
    return data;
  }
}

class CartItems {
  String? product;
  int? quantity;
  String? color;
  int? price;
  String? sId;

  CartItems({this.product, this.quantity, this.color, this.price, this.sId});

  CartItems.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    quantity = json['quantity'];
    color = json['color'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product;
    data['quantity'] = quantity;
    data['color'] = color;
    data['price'] = price;
    data['_id'] = sId;
    return data;
  }
}
