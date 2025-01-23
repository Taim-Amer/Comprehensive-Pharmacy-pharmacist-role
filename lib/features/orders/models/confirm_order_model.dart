class ConfirmOrderModel {
  bool? status;
  String? message;
  Data? data;

  ConfirmOrderModel({this.status, this.message, this.data});

  ConfirmOrderModel.fromJson(Map<String, dynamic> json) {
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

  Data(
      {this.id,
        this.customerId,
        this.pharmacistId,
        this.driverId,
        this.status,
        this.description,
        this.price,
        this.createdAt,
        this.updatedAt});

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
