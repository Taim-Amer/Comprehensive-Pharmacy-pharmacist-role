class OrderDetailsModel {
  bool? status;
  String? message;
  Data? data;

  OrderDetailsModel({this.status, this.message, this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? customerId;
  int? pharmacistId;
  int? driverId;
  String? status;
  String? description;
  String? price;
  String? createdAt;
  String? updatedAt;
  Pharmacist? pharmacist;
  Customer? customer;
  List<Files>? files;
  Null? driver;

  Data(
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
        this.files,
        this.driver});

  Data.fromJson(Map<String, dynamic> json) {
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
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(Files.fromJson(v));
      });
    }
    driver = json['driver'];
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
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    data['driver'] = driver;
    return data;
  }
}

class Pharmacist {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? lat;
  String? lng;
  Pharmacy? pharmacy;

  Pharmacist(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.lat,
        this.lng,
        this.pharmacy});

  Pharmacist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    pharmacy = json['pharmacy'] != null
        ? Pharmacy.fromJson(json['pharmacy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['lat'] = lat;
    data['lng'] = lng;
    if (pharmacy != null) {
      data['pharmacy'] = pharmacy!.toJson();
    }
    return data;
  }
}

class Pharmacy {
  int? id;
  int? userId;
  String? pharmacyName;
  int? status;
  String? createdAt;
  String? updatedAt;

  Pharmacy(
      {this.id,
        this.userId,
        this.pharmacyName,
        this.status,
        this.createdAt,
        this.updatedAt});

  Pharmacy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pharmacyName = json['pharmacy_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['pharmacy_name'] = pharmacyName;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? lat;
  String? lng;

  Customer({this.id, this.name, this.phone, this.email, this.lat, this.lng});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Files {
  int? id;
  int? orderId;
  String? filePath;
  String? createdAt;
  String? updatedAt;

  Files({this.id, this.orderId, this.filePath, this.createdAt, this.updatedAt});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    filePath = json['file_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['file_path'] = filePath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
