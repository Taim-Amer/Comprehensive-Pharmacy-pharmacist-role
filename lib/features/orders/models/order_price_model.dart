class OrderPriceModel {
  bool? status;
  String? message;
  Order? order;

  OrderPriceModel({this.status, this.message, this.order});

  OrderPriceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  int? customerId;
  int? pharmacistId;
  int? driverId;
  String? status;
  String? description;
  int? price;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
        this.customerId,
        this.pharmacistId,
        this.driverId,
        this.status,
        this.description,
        this.price,
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    pharmacistId = json['pharmacist_id'];
    driverId = json['driver_id'];
    status = json['status'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['pharmacist_id'] = pharmacistId;
    data['driver_id'] = driverId;
    data['status'] = status;
    data['description'] = description;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
