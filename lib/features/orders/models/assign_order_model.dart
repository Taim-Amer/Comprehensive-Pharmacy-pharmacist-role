class AssignOrderModel {
  bool? status;
  String? message;
  Order? order;
  DriverStatus? driverStatus;

  AssignOrderModel({this.status, this.message, this.order, this.driverStatus});

  AssignOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    driverStatus = json['driverStatus'] != null
        ? DriverStatus.fromJson(json['driverStatus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (driverStatus != null) {
      data['driverStatus'] = driverStatus!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  Null? customerId;
  int? pharmacistId;
  int? driverId;
  String? status;
  Null? description;
  String? price;
  String? createdAt;
  String? updatedAt;
  Pharmacist? pharmacist;
  Null? customer;
  Driver? driver;

  Order(
      {this.id,
        this.customerId,
        this.pharmacistId,
        this.driverId,
        this.status,
        this.description,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.pharmacist,
        this.customer,
        this.driver});

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
    pharmacist = json['pharmacist'] != null
        ? Pharmacist.fromJson(json['pharmacist'])
        : null;
    customer = json['customer'];
    driver =
    json['driver'] != null ? Driver.fromJson(json['driver']) : null;
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
    if (pharmacist != null) {
      data['pharmacist'] = pharmacist!.toJson();
    }
    data['customer'] = customer;
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    return data;
  }
}

class Pharmacist {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? isVerified;
  String? lat;
  String? lng;
  String? role;
  Null? fcmToken;
  String? createdAt;
  String? updatedAt;

  Pharmacist(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.isVerified,
        this.lat,
        this.lng,
        this.role,
        this.fcmToken,
        this.createdAt,
        this.updatedAt});

  Pharmacist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['is_verified'];
    lat = json['lat'];
    lng = json['lng'];
    role = json['role'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['is_verified'] = isVerified;
    data['lat'] = lat;
    data['lng'] = lng;
    data['role'] = role;
    data['fcm_token'] = fcmToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Driver {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? isVerified;
  String? lat;
  String? lng;
  String? role;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;

  Driver(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.isVerified,
        this.lat,
        this.lng,
        this.role,
        this.fcmToken,
        this.createdAt,
        this.updatedAt});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['is_verified'];
    lat = json['lat'];
    lng = json['lng'];
    role = json['role'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['is_verified'] = isVerified;
    data['lat'] = lat;
    data['lng'] = lng;
    data['role'] = role;
    data['fcm_token'] = fcmToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class DriverStatus {
  int? id;
  int? driverId;
  int? orderId;
  String? status;
  String? createdAt;
  String? updatedAt;

  DriverStatus(
      {this.id,
        this.driverId,
        this.orderId,
        this.status,
        this.createdAt,
        this.updatedAt});

  DriverStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    orderId = json['order_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['driver_id'] = driverId;
    data['order_id'] = orderId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
